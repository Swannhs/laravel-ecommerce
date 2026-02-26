<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Ecommerce\Events\OrderPlacedEvent;
use Exception;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\URL;

class SendWebhookWhenOrderPlaced
{
    public function handle(OrderPlacedEvent $event): void
    {
        $webhookURL = get_ecommerce_setting('order_placed_webhook_url');

        if (! $webhookURL || ! URL::isValidUrl($webhookURL) || BaseHelper::hasDemoModeEnabled()) {
            return;
        }

        try {
            $order = $event->order;

            $data = $order->toWebhookData();

            $data = apply_filters('ecommerce_order_placed_webhook_data', $data, $order);

            Http::withoutVerifying()
                ->acceptJson()
                ->post($webhookURL, $data);
        } catch (Exception $exception) {
            info($exception->getMessage());
        }
    }
}
