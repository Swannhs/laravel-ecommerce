<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\DatePickerFieldOption;
use App\Core\Base\Forms\FieldOptions\EmailFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\PhoneNumberFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\FieldOptions\TextareaFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\DatePickerField;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\PhoneNumberField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Enums\CustomerStatusEnum;
use App\Plugins\Ecommerce\Http\Requests\CustomerCreateRequest;
use App\Plugins\Ecommerce\Models\Customer;

class CustomerForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/address.js')
            ->addStylesDirectly('vendor/core/plugins/ecommerce/css/review.css');

        $this
            ->model(Customer::class)
            ->setValidatorClass(CustomerCreateRequest::class)
            ->template('plugins/ecommerce::customers.form')
            ->columns()
            ->add('name', TextField::class, NameFieldOption::make()->maxLength(120)->colspan(1))
            ->add('email', TextField::class, EmailFieldOption::make()->required()->colspan(1))
            ->add(
                'phone',
                PhoneNumberField::class,
                PhoneNumberFieldOption::make()
                    ->label(trans('plugins/ecommerce::customer.phone'))
                    ->placeholder(trans('plugins/ecommerce::customer.phone_placeholder'))
                    ->maxLength(15)
                    ->colspan(1)
                    ->withCountryCodeSelection()
            )
            ->add(
                'dob',
                DatePickerField::class,
                DatePickerFieldOption::make()
                    ->label(trans('plugins/ecommerce::customer.dob'))
                    ->defaultValue(null)
                    ->colspan(1)
            )
            ->add(
                'is_change_password',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::customer.change_password'))
                    ->attributes([
                        'data-bb-toggle' => 'collapse',
                        'data-bb-target' => '#password-collapse',
                    ])
                    ->defaultValue(0)
                    ->colspan(2)
            )
            ->add(
                'password',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::customer.password'))
                    ->required()
                    ->maxLength(60)
                    ->collapsible('is_change_password', 1, ! $this->getModel()->exists || $this->getModel()->is_change_password)
                    ->colspan(1)
            )
            ->add(
                'password_confirmation',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::customer.password_confirmation'))
                    ->required()
                    ->maxLength(60)
                    ->collapsible('is_change_password', 1, ! $this->getModel()->exists || $this->getModel()->is_change_password)
                    ->colspan(1)
            )
            ->add(
                'private_notes',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(trans('plugins/ecommerce::customer.private_notes'))
                    ->helperText(trans('plugins/ecommerce::customer.private_notes_helper'))
                    ->rows(2)
                    ->colspan(2)
            )
            ->add('status', SelectField::class, StatusFieldOption::make()->choices(CustomerStatusEnum::labels()))
            ->add(
                'avatar',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(trans('plugins/ecommerce::customer.avatar'))
            )
            ->setBreakFieldPoint('status')
            ->when($this->getModel()->getKey(), function (): void {
                /**
                 * @var Customer $model
                 */
                $model = $this->getModel();

                $wishlist = $model->wishlist->loadMissing('product');

                $metaBoxes = [
                    'addresses' => [
                        'title' => trans('plugins/ecommerce::addresses.addresses'),
                        'content' => view('plugins/ecommerce::customers.addresses.addresses', [
                            'addresses' => $model->addresses()->get(),
                        ])->render(),
                        'header_actions' => view('plugins/ecommerce::customers.addresses.address-actions')->render(),
                        'wrap' => true,
                        'has_table' => true,
                    ],
                    'wishlist' => [
                        'title' => trans('plugins/ecommerce::ecommerce.wishlist'),
                        'content' => view('plugins/ecommerce::customers.wishlist', compact('wishlist'))->render(),
                        'wrap' => true,
                        'has_table' => true,
                    ],
                ];

                if (is_plugin_active('payment')) {
                    $metaBoxes['payments'] = [
                        'title' => trans('plugins/ecommerce::payment.name'),
                        'content' => view('plugins/ecommerce::customers.payments.payments', [
                            'payments' => $model->payments()->get(),
                        ])->render(),
                        'wrap' => true,
                        'has_table' => true,
                    ];
                }

                $this->addMetaBoxes($metaBoxes);
            });
    }
}
