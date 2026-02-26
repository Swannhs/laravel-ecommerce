<?php

namespace App\Plugins\Ecommerce\Facades;

use App\Plugins\Ecommerce\Supports\InvoiceHelper as BaseInvoiceHelper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static mixed store(\App\Plugins\Ecommerce\Models\Order $order)
 * @method static \App\Core\Base\Supports\Pdf makeInvoicePDF(\App\Plugins\Ecommerce\Models\Invoice $invoice)
 * @method static string generateInvoice(\App\Plugins\Ecommerce\Models\Invoice $invoice)
 * @method static \Illuminate\Http\Response downloadInvoice(\App\Plugins\Ecommerce\Models\Invoice $invoice)
 * @method static \Illuminate\Http\Response streamInvoice(\App\Plugins\Ecommerce\Models\Invoice $invoice)
 * @method static string getInvoiceTemplate()
 * @method static string getInvoiceTemplatePath()
 * @method static string getInvoiceTemplateCustomizedPath()
 * @method static \App\Plugins\Ecommerce\Models\Invoice getDataForPreview()
 * @method static array getVariables()
 * @method static string|null getCompanyCountry()
 * @method static string|null getCompanyState()
 * @method static string|null getCompanyCity()
 * @method static string|null getCompanyZipCode()
 * @method static string getLanguageSupport()
 * @method static array supportedDateFormats()
 * @method static array getDefaultInvoiceTemplatesFilter()
 * @method static string getInvoiceUrl(\App\Plugins\Ecommerce\Models\Invoice $invoice)
 * @method static string getInvoiceDownloadUrl(\App\Plugins\Ecommerce\Models\Invoice $invoice)
 *
 * @see \App\Plugins\Ecommerce\Supports\InvoiceHelper
 */
class InvoiceHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseInvoiceHelper::class;
    }
}
