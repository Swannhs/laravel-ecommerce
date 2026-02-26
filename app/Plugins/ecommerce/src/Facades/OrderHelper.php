<?php

namespace App\Plugins\Ecommerce\Facades;

use App\Plugins\Ecommerce\Supports\OrderHelper as BaseOrderHelper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \Illuminate\Support\Collection|\Illuminate\Database\Eloquent\Model|array|bool processOrder(array|string|null $orderIds, string|null $chargeId = null)
 * @method static array validateAndReserveStock(array $cartItems)
 * @method static bool decreaseProductQuantity(\App\Plugins\Ecommerce\Models\Order $order)
 * @method static \App\Core\Base\Supports\EmailHandler setEmailVariables(\App\Plugins\Ecommerce\Models\Order $order)
 * @method static array getEmailVariables(\App\Plugins\Ecommerce\Models\Order $order)
 * @method static bool sendOrderConfirmationEmail(\App\Plugins\Ecommerce\Models\Order $order, bool $saveHistory = false, bool $force = false)
 * @method static bool sendOrderEmail(\App\Plugins\Ecommerce\Models\Order $order, string $template, string|array|null $email = null, array $additionalVariables = [], array $args = [], bool $debug = false)
 * @method static void sendEmailForDigitalProducts(\App\Plugins\Ecommerce\Models\Order $order)
 * @method static \App\Plugins\Ecommerce\Models\Order setOrderCompleted(string|int $orderId, \Illuminate\Http\Request $request, string|int $userId = 0)
 * @method static array|string|null getShippingMethod(string $method, array|string|null $option = null)
 * @method static string|null processHistoryVariables(\App\Plugins\Ecommerce\Models\OrderHistory|\App\Plugins\Ecommerce\Models\ShipmentHistory $history)
 * @method static array setOrderSessionData(string|null $token, array|string $data)
 * @method static string getOrderSessionToken()
 * @method static array getOrderSessionData(string|null $token = null)
 * @method static array cleanData(array $data)
 * @method static array mergeOrderSessionData(string|null $token, array|string $data)
 * @method static void clearSessions(string|null $token)
 * @method static array handleAddCart(\App\Plugins\Ecommerce\Models\Product $product, \Illuminate\Http\Request $request)
 * @method static array getProductOptionData(array $data, string|int|null $productId = null)
 * @method static array processAddressOrder(string|int $currentUserId, array $sessionData, \Illuminate\Http\Request $request)
 * @method static array checkAndCreateOrderAddress(array $addressData, array $sessionData)
 * @method static array processOrderProductData(\Illuminate\Support\Collection|array $products, array $sessionData)
 * @method static array processOrderInCheckout($sessionData, $request, $cartItems, $order, array $generalData)
 * @method static mixed createOrder(\Illuminate\Http\Request $request, string|int $currentUserId, string $token, array $cartItems)
 * @method static bool confirmPayment(\App\Plugins\Ecommerce\Models\Order $order)
 * @method static \App\Plugins\Ecommerce\Models\Order cancelOrder(\App\Plugins\Ecommerce\Models\Order $order, string|null $reason = null, string|null $reasonDescription = null)
 * @method static \App\Plugins\Ecommerce\Models\Order shippingStatusDelivered(\App\Plugins\Ecommerce\Models\Shipment $shipment, \Illuminate\Http\Request $request, string|int $userId = 0)
 * @method static string|null getOrderBankInfo(\App\Plugins\Ecommerce\Models\Order|\Illuminate\Database\Eloquent\Collection $orders)
 * @method static void confirmOrder(\App\Plugins\Ecommerce\Models\Order $order)
 * @method static \App\Plugins\Ecommerce\Models\Order|false|null createOrUpdateIncompleteOrder(array $data, \App\Plugins\Ecommerce\Models\Order|null $order = null)
 * @method static void captureFootprints(\App\Plugins\Ecommerce\Models\Order $order)
 *
 * @see \App\Plugins\Ecommerce\Supports\OrderHelper
 */
class OrderHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseOrderHelper::class;
    }
}
