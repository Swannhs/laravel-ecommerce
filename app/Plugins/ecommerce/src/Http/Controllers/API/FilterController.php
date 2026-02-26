<?php

namespace App\Plugins\Ecommerce\Http\Controllers\API;

use App\Packages\Api\Http\Controllers\BaseApiController;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Http\Resources\API\FilterResource;
use App\Plugins\Ecommerce\Models\ProductCategory;
use App\Plugins\Ecommerce\Supports\RenderProductAttributeSetsOnSearchPageSupport;
use Exception;
use Illuminate\Http\Request;

class FilterController extends BaseApiController
{
    /**
     * Get filter data for products
     *
     * @group Filters
     * @param Request $request
     * @queryParam category int Category ID to get filter data for a specific category. No-example
     *
     * @return mixed
     */
    public function getFilters(Request $request)
    {
        $category = null;
        $categoryId = $request->input('category');

        if ($categoryId) {
            $category = ProductCategory::query()
                ->wherePublished()
                ->where('id', $categoryId)
                ->first();
        }

        try {
            $filterData = EcommerceHelper::dataForFilter($category, true);

            $attributeSetsSupport = new RenderProductAttributeSetsOnSearchPageSupport($request);

            if (EcommerceHelper::isEnabledFilterProductsByAttributes()) {
                $attributeSets = $attributeSetsSupport->getAttributeSets();
                $selectedAttrs = $attributeSetsSupport->getSelectedAttributes($attributeSets);

                $filterData[] = $attributeSets;
                $filterData[] = $selectedAttrs;
            }

            return $this
                ->httpResponse()
                ->setData(new FilterResource($filterData))
                ->toApiResponse();
        } catch (Exception $e) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($e->getMessage())
                ->toApiResponse();
        }
    }
}
