<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Core\Base\Events\AdminNotificationEvent;
use App\Core\Base\Supports\AdminNotificationItem;
use App\Plugins\Ecommerce\Enums\ShippingStatusEnum;
use App\Plugins\Ecommerce\Events\ShippingStatusChanged;
use App\Plugins\Ecommerce\Facades\OrderHelper;

class SendShippingStatusChangedNotification
{
    public function handle(ShippingStatusChanged $event): void
    {
        $order = $event->shipment->order;
        $shipment = $event->shipment;

        $shippingVariables = [
            'shipping_company_name' => $shipment->shipping_company_name,
            'tracking_id' => $shipment->tracking_id,
            'tracking_link' => $shipment->tracking_link,
        ];

        if ($event->shipment->status == ShippingStatusEnum::DELIVERING) {
            OrderHelper::sendOrderEmail($order, 'customer_delivery_order', null, $shippingVariables);
        }

        if ($event->shipment->status == ShippingStatusEnum::DELIVERED) {
            OrderHelper::sendOrderEmail($order, 'customer_order_delivered', null, $shippingVariables);

            event(
                new AdminNotificationEvent(
                    AdminNotificationItem::make()
                        ->title(trans('plugins/ecommerce::order.order_completed_notifications.order_completed_with_code', ['code' => $order->code]))
                        ->description(
                            trans('plugins/ecommerce::order.order_completed_notifications.description', [
                                'order' => $order->code,
                            ])
                        )
                        ->action(
                            trans('plugins/ecommerce::order.new_order_notifications.view'),
                            route('orders.edit', $order->id)
                        )
                )
            );
        } else {
            event(
                new AdminNotificationEvent(
                    AdminNotificationItem::make()
                        ->title(
                            trans(
                                'plugins/ecommerce::order.update_shipping_status_notifications.update_shipping_status_with_code',
                                ['code' => $order->code]
                            )
                        )
                        ->description(
                            trans('plugins/ecommerce::order.update_shipping_status_notifications.description', [
                                'order' => $order->code,
                                'description' => $event->previousShipment
                                    ? trans('plugins/ecommerce::order.update_shipping_status_notifications.changed_from_to', [
                                        'old_status' => ShippingStatusEnum::getLabel($event->previousShipment['status']),
                                        'new_status' => ShippingStatusEnum::getLabel($event->shipment->status),
                                      ])
                                    : trans('plugins/ecommerce::order.update_shipping_status_notifications.changed_to', [
                                        'status' => ShippingStatusEnum::getLabel($event->shipment->status),
                                      ]),
                            ])
                        )
                        ->action(
                            trans('plugins/ecommerce::order.new_order_notifications.view'),
                            route('orders.edit', $order->id)
                        )
                )
            );
        }
    }
}
