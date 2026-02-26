<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Fronts;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Facades\ProductCategoryHelper;
use App\Plugins\Ecommerce\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Services\Products\GetProductService;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class PublicAjaxController extends BaseController
{
    public function ajaxSearchProducts(Request $request, GetProductService $productService)
    {
        $request->merge(['num' => 12]);

        $with = EcommerceHelper::withProductEagerLoadingRelations();

        $products = $productService->getProduct($request, null, null, $with);

        $queries = $request->input();

        foreach ($queries as $key => $query) {
            if (! $query || $key == 'num' || (is_array($query) && ! Arr::get($query, 0))) {
                unset($queries[$key]);
            }
        }

        $total = $products->count();

        return $this
            ->httpResponse()
            ->setData(view(EcommerceHelper::viewPath('includes.ajax-search-results'), compact('products', 'queries'))->render())
            ->setMessage($total != 1 ? __(':total Products found', compact('total')) : __(':total Product found', compact('total')));
    }

    public function ajaxGetCategoriesDropdown()
    {
        $categoriesDropdownView = Theme::getThemeNamespace('partials.product-categories-dropdown');

        return $this
            ->httpResponse()
            ->setData([
                'select' => ProductCategoryHelper::renderProductCategoriesSelect(),
                'dropdown' => view()->exists($categoriesDropdownView)
                    ? view($categoriesDropdownView)->render()
                    : null,
            ]);
    }
}
