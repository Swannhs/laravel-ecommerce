<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Http\Requests\ProductTagRequest;
use App\Plugins\Ecommerce\Models\ProductTag;

class ProductTagForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(ProductTag::class)
            ->setValidatorClass(ProductTagRequest::class)
            ->add('name', TextField::class, NameFieldOption::make())
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
