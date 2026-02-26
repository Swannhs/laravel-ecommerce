<?php

namespace App\Plugins\Marketplace\Listeners;

use App\Plugins\Ecommerce\Enums\ShippingCodStatusEnum;
use App\Plugins\Ecommerce\Enums\ShippingStatusEnum;
use App\Plugins\Ecommerce\Events\OrderCreated;
use App\Plugins\Ecommerce\Events\OrderPlacedEvent;
use App\Plugins\Ecommerce\Models\Shipment;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Payment\Enums\PaymentStatusEnum;
use Illuminate\Support\Arr;

class OrderCreatedEmailNotification
{
    public function handle(OrderCreated|OrderPlacedEvent $event): void
    {
        $storeIds = [];
        $order = $event->order;
        $order->loadMissing([
            'products',
            'products.product',
        ]);

        foreach ($order->products as $orderProduct) {
            $product = $orderProduct->product;

            if (! $product) {
                continue;
            }

            if ($product->original_product->store_id && $product->original_product->store?->id) {
                $storeIds[] = $product->original_product->store_id;
            }
        }

        if (! count($storeIds)) {
            return;
        }

        $order->store_id = Arr::first($storeIds);
        $order->save();

        $existingShipment = Shipment::query()->where('order_id', $order->getKey())->first();

        if (! $existingShipment) {
            Shipment::query()->create([
                'order_id' => $order->getKey(),
                'user_id' => 0,
                'weight' => $order->products_weight,
                'cod_amount' => is_plugin_active('payment') ? ($order->payment->status != PaymentStatusEnum::COMPLETED ? $order->amount : 0) : null,
                'cod_status' => ShippingCodStatusEnum::PENDING,
                'type' => $order->shipping_method,
                'status' => ShippingStatusEnum::PENDING,
                'price' => $order->shipping_amount,
                'store_id' => $order->store_id,
            ]);
        }

        MarketplaceHelper::sendMailToVendorAfterProcessingOrder($order);
    }
}
