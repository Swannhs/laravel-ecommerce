<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Http\Requests\SpecificationTableRequest;
use App\Plugins\Ecommerce\Models\SpecificationGroup;
use App\Plugins\Ecommerce\Models\SpecificationTable;

class SpecificationTableForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScripts('jquery-ui');

        $groups = SpecificationGroup::query()->pluck('name', 'id');

        $this
            ->model(SpecificationTable::class)
            ->setValidatorClass(SpecificationTableRequest::class)
            ->add(
                'name',
                TextField::class,
                NameFieldOption::make()
                    ->label(trans('plugins/ecommerce::product-specification.specification_tables.fields.name'))
                    ->required(),
            )
            ->add(
                'description',
                TextareaField::class,
                DescriptionFieldOption::make()
            )
            ->when($groups->isNotEmpty(), function (FormAbstract $form) use ($groups): void {
                $form->add(
                    'groups',
                    HtmlField::class,
                    HtmlFieldOption::make()
                        ->content(view('plugins/ecommerce::specification-tables.groups', [
                            'groups' => $groups,
                            'selectedGroups' => $this->getModel() ? $this->getModel()->groups : collect(),
                        ])->render())
                );
            });
    }
}
