<?php

namespace App\Plugins\Ecommerce\Http\Controllers\API;

use App\Packages\Api\Http\Controllers\BaseApiController;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Http\Requests\API\CategoryRequest;
use App\Plugins\Ecommerce\Http\Resources\API\AvailableProductResource;
use App\Plugins\Ecommerce\Http\Resources\API\ProductCategoryDetailResource;
use App\Plugins\Ecommerce\Http\Resources\API\ProductCategoryResource;
use App\Plugins\Ecommerce\Models\ProductCategory;
use App\Plugins\Ecommerce\Services\Products\GetProductService;
use App\Packages\Slug\Facades\SlugHelper;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ProductCategoryController extends BaseApiController
{
    /**
     * Get list of product categories
     *
     * @group Product Categories
     * @param CategoryRequest $request
     * @queryParam categories nullable array List of category IDs if you need filter by categories, (e.g. [1,2,3]). No-example
     * @queryParam page int Page number. Default: 1. No-example
     * @queryParam per_page int Number of items per page. Default: 16. No-example
     *
     * @return JsonResponse
     */
    public function index(CategoryRequest $request)
    {
        $categories = ProductCategory::query()
            ->wherePublished()
            ->oldest('order')->latest()
            ->when($request->input('categories'), function ($query, $categoryIds) {
                return $query->whereIn('id', $categoryIds);
            })
            ->when($request->has('is_featured'), function ($query) use ($request) {
                return $query->where('is_featured', $request->boolean('is_featured'));
            })
            ->when($request->input('per_page') > 0, function ($query) use ($request) {
                return $query->paginate($request->input('per_page'));
            }, function ($query) {
                return $query->get();
            });

        return $this
            ->httpResponse()
            ->setData(ProductCategoryResource::collection($categories))
            ->toApiResponse();
    }

    /**
     * Get product category details by slug
     *
     * @group Product Categories
     * @param string $slug Category slug
     * @return JsonResponse
     *
     * @throws \Illuminate\Http\Exceptions\HttpResponseException
     */
    public function show(string $slug)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(ProductCategory::class));

        abort_unless($slug, 404);

        $category = ProductCategory::query()
            ->where('id', $slug->reference_id)
            ->firstOrFail();

        return $this
            ->httpResponse()
            ->setData(new ProductCategoryDetailResource($category))
            ->toApiResponse();
    }

    /**
     * Get products by category
     *
     * @group Product Categories
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function products(int|string $id, Request $request)
    {
        if (! EcommerceHelper::productFilterParamsValidated($request)) {
            $request = request();
        }

        $category = ProductCategory::query()->findOrFail($id);

        $with = EcommerceHelper::withProductEagerLoadingRelations();

        $categoryIds = ProductCategory::getChildrenIds($category->activeChildren, [$category->getKey()]);

        $requestCategories = (array) $request->input('categories', []) ?: [];

        $request->merge(['categories' => [...$categoryIds, ...$requestCategories]]);

        $products = app(GetProductService::class)->getProduct($request, null, null, $with);

        return $this
            ->httpResponse()
            ->setData(AvailableProductResource::collection($products))
            ->toApiResponse();
    }
}
