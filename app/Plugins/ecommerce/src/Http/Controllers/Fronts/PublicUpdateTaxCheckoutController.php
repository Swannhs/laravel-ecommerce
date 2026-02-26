<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Fronts;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Facades\Cart;
use App\Plugins\Ecommerce\Facades\OrderHelper;
use App\Plugins\Ecommerce\Services\HandleCheckoutOrderData;
use App\Plugins\Ecommerce\Services\HandleTaxService;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class PublicUpdateTaxCheckoutController extends BaseController
{
    public function __invoke(Request $request, HandleCheckoutOrderData $handleCheckoutOrderData)
    {
        $sessionCheckoutData = OrderHelper::getOrderSessionData(
            $token = OrderHelper::getOrderSessionToken()
        );

        /**
         * @var Collection $products
         */
        $products = Cart::instance('cart')->products();

        $checkoutOrderData = $handleCheckoutOrderData->execute(
            $request,
            $products,
            $token,
            $sessionCheckoutData
        );

        app(HandleTaxService::class)->execute($products, [
            ...$sessionCheckoutData,
            'country' => $request->input('address.country'),
            'state' => $request->input('address.state'),
            'city' => $request->input('address.city'),
            'zip_code' => $request->input('address.zip_code'),
        ]);

        return $this
            ->httpResponse()
            ->setData([
                'amount' => view('plugins/ecommerce::orders.partials.amount', [
                    'products' => $products,
                    'rawTotal' => $checkoutOrderData->rawTotal,
                    'orderAmount' => $checkoutOrderData->orderAmount,
                    'shipping' => $checkoutOrderData->shipping,
                    'sessionCheckoutData' => $sessionCheckoutData,
                    'shippingAmount' => $checkoutOrderData->shippingAmount,
                    'promotionDiscountAmount' => $checkoutOrderData->promotionDiscountAmount,
                    'couponDiscountAmount' => $checkoutOrderData->couponDiscountAmount,
                    'paymentFee' => $checkoutOrderData->paymentFee,
                ])->render(),
            ]);
    }
}
