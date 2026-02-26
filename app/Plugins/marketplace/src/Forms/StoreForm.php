<?php

namespace App\Plugins\Marketplace\Forms;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\ContentFieldOption;
use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\EmailFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\EditorField;
use App\Core\Base\Forms\Fields\EmailField;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Enums\CustomerStatusEnum;
use App\Plugins\Ecommerce\Forms\Concerns\HasLocationFields;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Forms\Concerns\HasSubmitButton;
use App\Plugins\Marketplace\Http\Requests\StoreRequest;
use App\Plugins\Marketplace\Models\Store;

class StoreForm extends FormAbstract
{
    use HasLocationFields;
    use HasSubmitButton;

    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/marketplace/js/store.js');

        $this
            ->model(Store::class)
            ->setValidatorClass(StoreRequest::class)
            ->columns(6)
            ->template('core/base::forms.form-no-wrap')
            ->hasFiles()
            ->add('name', TextField::class, NameFieldOption::make()->required()->colspan(6))
            ->add(
                'slug',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(view('plugins/marketplace::stores.partials.shop-url-field', ['store' => $this->getModel()])->render())
                    ->colspan(3)
            )
            ->add('email', EmailField::class, EmailFieldOption::make()->required()->colspan(3))
            ->add('phone', TextField::class, [
                'label' => trans('plugins/marketplace::store.forms.phone'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('plugins/marketplace::store.forms.phone_placeholder'),
                    'data-counter' => 15,
                ],
                'colspan' => 6,
            ])
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->colspan(6))
            ->add('content', EditorField::class, ContentFieldOption::make()->colspan(6))
            ->addLocationFields()
            ->add(
                'company',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/marketplace::store.forms.company'))
                    ->placeholder(trans('plugins/marketplace::store.forms.company_placeholder'))
                    ->maxLength(255)
                    ->colspan(3)
            )
            ->add(
                'tax_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/marketplace::store.forms.tax_id'))
                    ->colspan(3)
                    ->maxLength(255)
            )
            ->add(
                'logo',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(trans('plugins/marketplace::store.forms.logo'))
                    ->colspan(2)
            )
            ->add(
                'logo_square',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(trans('plugins/marketplace::store.forms.logo_square'))
                    ->helperText(trans('plugins/marketplace::store.forms.logo_square_helper'))
                    ->colspan(2)
            )
            ->add(
                'cover_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(trans('plugins/marketplace::store.forms.cover_image'))
                    ->colspan(2)
            )
            ->add('status', SelectField::class, [
                'label' => trans('core/base::tables.status'),
                'required' => true,
                'choices' => BaseStatusEnum::labels(),
                'help_block' => [
                    TextField::class => trans('plugins/marketplace::marketplace.helpers.store_status', [
                        'customer' => CustomerStatusEnum::LOCKED()->label(),
                        'status' => BaseStatusEnum::PUBLISHED()->label(),
                    ]),
                ],
                'colspan' => 3,
            ])
            ->add('customer_id', SelectField::class, [
                'label' => trans('plugins/marketplace::store.forms.store_owner'),
                'required' => true,
                'choices' => [0 => trans('plugins/marketplace::store.forms.select_store_owner')] + Customer::query()
                    ->where('is_vendor', true)
                    ->pluck('name', 'id')
                    ->all(),
                'colspan' => 3,
            ])
            ->when(! MarketplaceHelper::hideStoreSocialLinks(), function (): void {
                $this
                    ->add('extended_info_content', HtmlField::class, [
                        'html' => view('plugins/marketplace::partials.extra-content', ['model' => $this->getModel()]),
                    ]);
            });
    }
}
