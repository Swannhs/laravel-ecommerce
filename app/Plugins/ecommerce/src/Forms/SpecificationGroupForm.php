<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Http\Requests\SpecificationGroupRequest;
use App\Plugins\Ecommerce\Models\SpecificationGroup;

class SpecificationGroupForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(SpecificationGroup::class)
            ->setValidatorClass(SpecificationGroupRequest::class)
            ->add(
                'name',
                TextField::class,
                NameFieldOption::make()
                    ->required(),
            )
            ->add(
                'description',
                TextareaField::class,
                DescriptionFieldOption::make()
            );
    }
}
