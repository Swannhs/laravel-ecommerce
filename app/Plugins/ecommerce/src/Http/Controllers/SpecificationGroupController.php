<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Core\Base\Forms\FormAbstract;
use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Ecommerce\Forms\SpecificationGroupForm;
use App\Plugins\Ecommerce\Http\Requests\SpecificationGroupRequest;
use App\Plugins\Ecommerce\Models\SpecificationGroup;
use App\Plugins\Ecommerce\Tables\SpecificationGroupTable;
use App\Core\Table\Abstracts\TableAbstract;

class SpecificationGroupController extends BaseController
{
    public function index()
    {
        $this->pageTitle(trans('plugins/ecommerce::product-specification.specification_groups.title'));

        return app($this->getTable())->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/ecommerce::product-specification.specification_groups.create.title'));

        return $this->getForm()::create()->renderForm();
    }

    public function store(SpecificationGroupRequest $request)
    {
        $form = $this->getForm()::create()->setRequest($request)->onlyValidatedData();

        $form->saving(function (SpecificationGroupForm $form): void {
            $model = $form->getModel();
            if (! empty($this->getAdditionalDataForSaving())) {
                $model->fill($this->getAdditionalDataForSaving());
            }
            $form->save();
        });

        return $this
            ->httpResponse()
            ->withCreatedSuccessMessage()
            ->setPreviousRoute($this->getIndexRouteName())
            ->setNextRoute($this->getEditRouteName(), $form->getModel());
    }

    public function edit(string $group)
    {
        $group = $this->getSpecificationGroup($group);

        $this->pageTitle(trans('plugins/ecommerce::product-specification.specification_groups.edit.title', [
            'name' => $group->name,
        ]));

        return $this->getForm()::createFromModel($group)->renderForm();
    }

    public function update(SpecificationGroupRequest $request, string $group)
    {
        $group = $this->getSpecificationGroup($group);

        $form = $this->getForm()::createFromModel($group)->setRequest($request)->onlyValidatedData();
        $form->saving(function (SpecificationGroupForm $form): void {
            $model = $form->getModel();
            if (! empty($this->getAdditionalDataForSaving())) {
                $model->fill($this->getAdditionalDataForSaving());
            }
            $form->save();
        });

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage()
            ->setPreviousRoute($this->getIndexRouteName())
            ->setNextRoute($this->getEditRouteName(), $form->getModel());
    }

    public function destroy(string $group)
    {
        $group = $this->getSpecificationGroup($group);

        return DeleteResourceAction::make($group);
    }

    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/ecommerce::product-specification.specification_groups.title'), route($this->getIndexRouteName()));
    }

    /**
     * @return class-string<TableAbstract>
     */
    protected function getTable(): string
    {
        return SpecificationGroupTable::class;
    }

    /**
     * @return class-string<FormAbstract>
     */
    protected function getForm(): string
    {
        return SpecificationGroupForm::class;
    }

    protected function getAdditionalDataForSaving(): array
    {
        return [];
    }

    protected function getIndexRouteName(): string
    {
        return 'ecommerce.specification-groups.index';
    }

    protected function getEditRouteName(): string
    {
        return 'ecommerce.specification-groups.edit';
    }

    protected function getSpecificationGroup(string $group)
    {
        return SpecificationGroup::query()->findOrFail($group);
    }
}
