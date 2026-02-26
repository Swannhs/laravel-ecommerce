<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\CheckboxFieldOption;
use App\Core\Base\Forms\Fields\CheckboxField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Forms\Concerns\HasLocationFields;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use App\Plugins\Ecommerce\Http\Requests\StoreLocatorRequest;
use App\Plugins\Ecommerce\Models\StoreLocator;

class StoreLocatorForm extends FormAbstract
{
    use HasLocationFields;

    public function setup(): void
    {
        $this
            ->model(StoreLocator::class)
            ->setValidatorClass(StoreLocatorRequest::class)
            ->contentOnly()
            ->columns(6)
            ->add(
                'name',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::store-locator.store_name'))
                    ->required()
                    ->colspan(3)
            )
            ->add(
                'phone',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::ecommerce.phone'))
                    ->required()
                    ->colspan(3)
            )
            ->add(
                'email',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::ecommerce.email'))
                    ->required()
                    ->colspan(3)
            )
            ->addLocationFields(
                countryAttributes: [
                    'required' => true,
                ],
                stateAttributes: [
                    'required' => true,
                ],
                cityAttributes: [
                    'required' => true,
                ],
                addressAttributes: [
                    'required' => true,
                    'colspan' => 3,
                ],
                zipCodeAttributes: [
                    'colspan' => 3,
                ],
            )
            ->add(
                'is_shipping_location',
                CheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/ecommerce::store-locator.is_shipping_location'))
                    ->checked($this->getModel() && $this->getModel()->is_shipping_location)
                    ->colspan(6)
            );
    }
}
