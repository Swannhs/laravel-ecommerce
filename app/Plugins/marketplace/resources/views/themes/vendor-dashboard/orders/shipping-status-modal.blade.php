<x-core::form :url="$url">
    @if (MarketplaceHelper::allowVendorManageShipping())
        <x-core::form.select
            :label="trans('plugins/ecommerce::shipping.status')"
            name="status"
            :options="App\Plugins\Ecommerce\Enums\ShippingStatusEnum::labels()"
            :value="$shipment->status"
        />
    @else
        <x-core::form.select
            :label="trans('plugins/ecommerce::shipping.status')"
            name="status"
            :options="[
                App\Plugins\Ecommerce\Enums\ShippingStatusEnum::ARRANGE_SHIPMENT => App\Plugins\Ecommerce\Enums\ShippingStatusEnum::ARRANGE_SHIPMENT()->label(),
                App\Plugins\Ecommerce\Enums\ShippingStatusEnum::READY_TO_BE_SHIPPED_OUT => App\Plugins\Ecommerce\Enums\ShippingStatusEnum::READY_TO_BE_SHIPPED_OUT()->label(),
            ]"
            :value="$shipment->status"
        />
    @endif
</x-core::form>
