<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Ecommerce\Forms\ProductAttributeSetForm;
use App\Plugins\Ecommerce\Http\Requests\ProductAttributeSetsRequest;
use App\Plugins\Ecommerce\Models\ProductAttributeSet;
use App\Plugins\Ecommerce\Services\ProductAttributes\StoreAttributeSetService;
use App\Plugins\Ecommerce\Tables\ProductAttributeSetsTable;

class ProductAttributeSetsController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/ecommerce::product-attributes.name'), route('product-attribute-sets.index'));
    }

    public function index(ProductAttributeSetsTable $dataTable)
    {
        $this->pageTitle(trans('plugins/ecommerce::product-attributes.name'));

        return $dataTable->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/ecommerce::product-attributes.create'));

        return ProductAttributeSetForm::create()->renderForm();
    }

    public function store(ProductAttributeSetsRequest $request, StoreAttributeSetService $service)
    {
        $productAttributeSet = $service->execute($request, new ProductAttributeSet());

        $productAttributeSet->categories()->detach();

        $productAttributeSet->categories()->sync((array) $request->input('categories', []));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('product-attribute-sets.index'))
            ->setNextUrl(route('product-attribute-sets.edit', $productAttributeSet->getKey()))
            ->withCreatedSuccessMessage();
    }

    public function edit(ProductAttributeSet $productAttributeSet)
    {
        $this->pageTitle(trans('plugins/ecommerce::product-attributes.edit'));

        return ProductAttributeSetForm::createFromModel($productAttributeSet)
            ->renderForm();
    }

    public function update(
        ProductAttributeSet $productAttributeSet,
        ProductAttributeSetsRequest $request,
        StoreAttributeSetService $service,
    ) {
        $service->execute($request, $productAttributeSet);

        $productAttributeSet->categories()->detach();

        $productAttributeSet->categories()->sync((array) $request->input('categories', []));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('product-attribute-sets.index'))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(ProductAttributeSet $productAttributeSet)
    {
        return DeleteResourceAction::make($productAttributeSet);
    }
}
