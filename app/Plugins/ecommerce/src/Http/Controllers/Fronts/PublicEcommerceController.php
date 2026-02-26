<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Fronts;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Models\Currency;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class PublicEcommerceController extends BaseController
{
    public function changeCurrency(Request $request, ?string $title = null)
    {
        if (empty($title)) {
            $title = $request->input('currency');
        }

        if (! $title) {
            return $this->httpResponse();
        }

        /**
         * @var Currency $currency
         */
        $currency = Currency::query()->where('title', $title)->first();

        if ($currency) {
            cms_currency()->setApplicationCurrency($currency);
        }

        $url = URL::previous();

        if (! $url || $url === URL::current()) {
            return $this
                ->httpResponse()
                ->setNextUrl(BaseHelper::getHomepageUrl());
        }

        if (Str::contains($url, ['min_price', 'max_price'])) {
            $url = preg_replace('/&min_price=[0-9]+/', '', $url);
            $url = preg_replace('/&max_price=[0-9]+/', '', $url);
        }

        return $this
            ->httpResponse()
            ->setNextUrl($url);
    }
}
