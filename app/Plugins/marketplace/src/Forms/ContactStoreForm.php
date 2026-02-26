<?php

namespace App\Plugins\Marketplace\Forms;

use App\Core\Base\Forms\FieldOptions\ButtonFieldOption;
use App\Core\Base\Forms\FieldOptions\EmailFieldOption;
use App\Core\Base\Forms\FieldOptions\TextareaFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\EmailField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Plugins\Marketplace\Http\Requests\Fronts\ContactStoreRequest;
use App\Packages\Theme\FormFront;

class ContactStoreForm extends FormFront
{
    public static function formTitle(): string
    {
        return trans('plugins/marketplace::marketplace.contact_store.form_name');
    }

    public function setup(): void
    {
        $customer = auth('customer')->user();

        $this
            ->contentOnly()
            ->setUrl(route('public.ajax.stores.contact', $this->getModel()['id']))
            ->setValidatorClass(ContactStoreRequest::class)
            ->setFormOption('class', 'bb-contact-store-form')
            ->add(
                'name',
                TextField::class,
                TextFieldOption::make()
                    ->label(false)
                    ->placeholder(trans('plugins/marketplace::store.your_name'))
                    ->disabled((bool) $customer?->name)
                    ->value($customer?->name),
            )
            ->add(
                'email',
                EmailField::class,
                EmailFieldOption::make()
                    ->label(false)
                    ->placeholder(trans('plugins/marketplace::store.your_email_address'))
                    ->disabled((bool) $customer?->email)
                    ->value($customer?->email),
            )
            ->add(
                'content',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(false)
                    ->placeholder(trans('plugins/marketplace::store.type_your_message'))
                    ->rows(5)
            )
            ->add(
                'submit',
                'submit',
                ButtonFieldOption::make()
                    ->label(trans('plugins/marketplace::store.send_message'))
                    ->attributes(['class' => 'btn btn-primary'])
            );
    }
}
