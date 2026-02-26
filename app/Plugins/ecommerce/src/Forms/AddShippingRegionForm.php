<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Http\Requests\AddShippingRegionRequest;
use App\Plugins\Ecommerce\Models\Shipping;

class AddShippingRegionForm extends FormAbstract
{
    public function setup(): void
    {
        $existedCountries = Shipping::query()->pluck('country')->all();

        foreach ($existedCountries as &$existedCountry) {
            if (empty($existedCountry)) {
                $existedCountry = '';
            }
        }

        $countries = ['' => trans('plugins/ecommerce::shipping.all_countries')] + EcommerceHelper::getAvailableCountries();

        $countries = array_diff_key($countries, array_flip($existedCountries));

        $this
            ->model(Shipping::class)
            ->contentOnly()
            ->setUrl(route('shipping_methods.region.create'))
            ->setTitle(trans('plugins/ecommerce::shipping.add_shipping_region'))
            ->setValidatorClass(AddShippingRegionRequest::class)
            ->add(
                'region',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::shipping.country'))
                    ->required()
                    ->searchable()
                    ->choices($countries)
            );
    }
}
