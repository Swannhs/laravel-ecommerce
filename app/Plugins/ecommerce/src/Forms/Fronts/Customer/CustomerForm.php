<?php

namespace App\Plugins\Ecommerce\Forms\Fronts\Customer;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\FieldOptions\ButtonFieldOption;
use App\Core\Base\Forms\FieldOptions\EmailFieldOption;
use App\Core\Base\Forms\FieldOptions\InputFieldOption;
use App\Core\Base\Forms\FieldOptions\PhoneNumberFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\EmailField;
use App\Core\Base\Forms\Fields\PhoneNumberField;
use App\Core\Base\Forms\Fields\TextField;
use App\Plugins\Ecommerce\Http\Requests\EditAccountRequest;
use App\Plugins\Ecommerce\Models\Customer;
use App\Packages\Theme\FormFront;
use Illuminate\Support\Facades\App;

class CustomerForm extends FormFront
{
    public function setup(): void
    {
        $this
            ->model(Customer::class)
            ->setUrl(route('customer.edit-account'))
            ->setValidatorClass(EditAccountRequest::class)
            ->contentOnly()
            ->add(
                'name',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Full Name'))
            )
            ->when(get_ecommerce_setting('enabled_customer_dob_field', true), function (CustomerForm $form): void {
                $form->add(
                    'dob',
                    TextField::class,
                    InputFieldOption::make()
                        ->addAttribute('id', 'date_of_birth')
                        ->addAttribute('data-date-format', config('core.base.general.date_format.js.date'))
                        ->addAttribute('data-locale', App::getLocale())
                        ->value($this->getModel()->dob ? BaseHelper::formatDate($this->getModel()->dob) : null)
                        ->label(__('Date of birth'))
                );
            })
            ->add(
                'email',
                EmailField::class,
                EmailFieldOption::make()
                    ->disabled($this->getModel()->email)
            )
            ->add(
                'phone',
                PhoneNumberField::class,
                PhoneNumberFieldOption::make()
                    ->label(__('Phone'))
                    ->withCountryCodeSelection()
            )
            ->add(
                'submit',
                'submit',
                ButtonFieldOption::make()
                    ->label(__('Update'))
                    ->cssClass('btn btn-primary')
            );
    }
}
