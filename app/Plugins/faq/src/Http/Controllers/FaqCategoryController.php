<?php

namespace App\Plugins\Faq\Http\Controllers;

use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Faq\Forms\FaqCategoryForm;
use App\Plugins\Faq\Http\Requests\FaqCategoryRequest;
use App\Plugins\Faq\Models\FaqCategory;
use App\Plugins\Faq\Tables\FaqCategoryTable;

class FaqCategoryController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/faq::faq.name'))
            ->add(trans('plugins/faq::faq-category.name'), route('faq_category.index'));
    }

    public function index(FaqCategoryTable $table)
    {
        $this->pageTitle(trans('plugins/faq::faq-category.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/faq::faq-category.create'));

        return FaqCategoryForm::create()->renderForm();
    }

    public function store(FaqCategoryRequest $request)
    {
        $form = FaqCategoryForm::create()->setRequest($request);
        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('faq_category.index')
            ->setNextRoute('faq_category.edit', $form->getModel()->getKey())
            ->withCreatedSuccessMessage();
    }

    public function edit(FaqCategory $faqCategory)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $faqCategory->name]));

        return FaqCategoryForm::createFromModel($faqCategory)->renderForm();
    }

    public function update(FaqCategory $faqCategory, FaqCategoryRequest $request)
    {
        FaqCategoryForm::createFromModel($faqCategory)->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('faq_category.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(FaqCategory $faqCategory)
    {
        return DeleteResourceAction::make($faqCategory);
    }
}
