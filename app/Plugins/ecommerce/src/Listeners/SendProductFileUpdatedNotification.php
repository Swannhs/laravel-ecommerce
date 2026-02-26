<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\EmailHandler;
use App\Plugins\Ecommerce\Events\ProductFileUpdatedEvent;
use App\Plugins\Ecommerce\Models\OrderProduct;
use App\Plugins\Ecommerce\Models\ProductFile;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendProductFileUpdatedNotification implements ShouldQueue
{
    public function handle(ProductFileUpdatedEvent $event): void
    {
        $product = $event->product;
        $productFiles = $event->productFiles;

        $orderProducts = OrderProduct::query()
            ->where('product_id', $product->getKey())
            ->with('order.user', fn ($query) => $query->from('ec_customers')->select('id', 'name', 'email'))
            ->get();

        foreach ($orderProducts as $orderProduct) {
            $order = $orderProduct->order;
            $customer = $order->user;

            EmailHandler::setModule(ECOMMERCE_MODULE_SCREEN_NAME)
                ->setVariableValues([
                    'customer_name' => $customer->name,
                    'product_link' => $product->url,
                    'product_name' => $product->name,
                    'update_time' => $product->updated_at,
                    'download_link' => $orderProduct->download_hash_url,
                    'product_files' => $productFiles->map(function (ProductFile $file) {
                        return [
                            'name' => $file->file_name,
                            'size' => BaseHelper::humanFilesize($file->file_size),
                        ];
                    })->all(),
                ])
                ->sendUsingTemplate('product-file-updated', $customer?->email ?: $order->address->email);
        }
    }
}
