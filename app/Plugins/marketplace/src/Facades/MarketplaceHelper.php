<?php

namespace App\Plugins\Marketplace\Facades;

use App\Plugins\Marketplace\Supports\MarketplaceHelper as MarketplaceHelperSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static mixed view(string $view, array $data = [])
 * @method static string viewPath(string $view, bool $checkViewExists = true)
 * @method static array|string|int|bool|null getSetting(string $key, array|string|int|bool|null $default = '')
 * @method static string getSettingKey(string $key = '')
 * @method static array discountTypes()
 * @method static string getAssetVersion()
 * @method static bool hideStorePhoneNumber()
 * @method static bool hideStoreEmail()
 * @method static bool hideStoreSocialLinks()
 * @method static bool hideStoreAddress()
 * @method static bool allowVendorManageShipping()
 * @method static mixed sendMailToVendorAfterProcessingOrder($orders)
 * @method static \App\Core\Base\Supports\EmailHandler setEmailVendorVariables(\App\Plugins\Ecommerce\Models\Order $order)
 * @method static bool isCommissionCategoryFeeBasedEnabled()
 * @method static float maxFilesizeUploadByVendor()
 * @method static int maxProductImagesUploadByVendor()
 * @method static bool isVendorRegistrationEnabled()
 * @method static float getMinimumWithdrawalAmount()
 * @method static bool allowVendorDeleteTheirOrders()
 * @method static bool isEnabledMessagingSystem()
 * @method static array getAllowedSocialLinks()
 * @method static bool isSingleVendorCheckout()
 * @method static array mediaMimeTypesAllowed()
 * @method static bool isEnabledVendorCategoriesFilter()
 * @method static bool isChargeShippingPerVendor()
 * @method static \Illuminate\Support\Collection getCategoriesForVendor(string|int $storeId)
 *
 * @see \App\Plugins\Marketplace\Supports\MarketplaceHelper
 */
class MarketplaceHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return MarketplaceHelperSupport::class;
    }
}
