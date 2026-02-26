<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Fronts;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Services\Products\GetProductBySlugService;
use App\Plugins\Ecommerce\Services\Products\GetProductWithCrossSalesBySlugService;
use App\Plugins\Ecommerce\Services\Products\ProductCrossSalePriceService;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Http\Request;

class QuickShopController extends BaseController
{
    public function show(
        string $slug,
        GetProductBySlugService $getProductBySlugService,
        GetProductWithCrossSalesBySlugService $getProductWithCrossSalesBySlugService,
        Request $request,
    ) {
        $request->validate([
            'reference_product' => ['sometimes', 'required', 'string'],
        ]);

        $product = $getProductBySlugService->handle($slug, [
            'with' => [
                'slugable',
                'tags',
                'tags.slugable',
                'options',
                'options.values',
            ],
        ]);

        abort_unless($product && $product->exists, 404);

        $referenceProduct = null;

        if (
            $request->filled('reference_product')
            && $referenceProduct = $getProductWithCrossSalesBySlugService->handle($request->input('reference_product'))
        ) {
            app(ProductCrossSalePriceService::class)->applyProduct($referenceProduct);
        }

        [$productImages, $productVariation, $selectedAttrs] = EcommerceHelper::getProductVariationInfo($product);

        $data = apply_filters('ecommerce_quick_shop_data', [
            'product' => $product,
            'productImages' => $productImages,
            'productVariation' => $productVariation,
            'selectedAttrs' => $selectedAttrs,
            'referenceProduct' => $referenceProduct,
        ]);

        $view = apply_filters('ecommerce_quick_shop_template', $this->getQuickShopTemplate());

        return $this
            ->httpResponse()
            ->setData(view($view, $data)->render());
    }

    protected function getQuickShopTemplate(): string
    {
        if (view()->exists($view = Theme::getThemeNamespace('views.ecommerce.quick-shop'))) {
            return $view;
        }

        if (view()->exists($view = Theme::getThemeNamespace('partials.ecommerce.quick-shop'))) {
            return $view;
        }

        if (view()->exists($view = Theme::getThemeNamespace('partials.quick-shop'))) {
            return $view;
        }

        return EcommerceHelper::viewPath('includes.quick-shop');
    }
}
