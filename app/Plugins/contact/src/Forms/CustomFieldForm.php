<?php

namespace App\Plugins\Contact\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\NumberFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Core\Base\Forms\MetaBox;
use App\Plugins\Contact\Enums\CustomFieldType;
use App\Plugins\Contact\Http\Requests\CustomFieldRequest;
use App\Plugins\Contact\Models\CustomField;
use App\Plugins\Language\Facades\Language;

class CustomFieldForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScripts('jquery-ui')
            ->addScriptsDirectly('vendor/core/plugins/contact/js/custom-field.js');

        $this
            ->model(CustomField::class)
            ->formClass('custom-field-form')
            ->setValidatorClass(CustomFieldRequest::class)
            ->add(
                'type',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/contact::contact.custom_field.type'))
                    ->required()
                    ->choices(CustomFieldType::labels())
            )
            ->add(
                'name',
                TextField::class,
                NameFieldOption::make()
                    ->required()
            )
            ->add(
                'placeholder',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/contact::contact.custom_field.placeholder'))
                    ->placeholder(trans('plugins/contact::contact.custom_field.placeholder'))
                    ->maxLength(120)
            )
            ->add(
                'required',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/contact::contact.custom_field.required'))
            )
            ->add(
                'order',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(trans('plugins/contact::contact.custom_field.order'))
                    ->required()
                    ->defaultValue(999)
            )
            ->when(is_plugin_active('language'), function (FormAbstract $form): void {
                $isDefaultLanguage = ! defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')
                    || ! request()->input('ref_lang')
                    || request()->input('ref_lang') === Language::getDefaultLocaleCode();
                $customField = $form->getModel();
                $options = $customField->options->sortBy('order');

                $form->addMetaBox(
                    MetaBox::make('contact-custom-field-options')
                        ->hasTable()
                        ->attributes([
                            'class' => 'custom-field-options-box',
                            'style' => sprintf(
                                'display: %s;',
                                in_array(old('type', $customField), [CustomFieldType::DROPDOWN, CustomFieldType::RADIO]) ? 'block' : 'none;'
                            ),
                        ])
                        ->title(trans('plugins/contact::contact.custom_field.options'))
                        ->content(view(
                            'plugins/contact::partials.custom-field-options',
                            compact('options', 'isDefaultLanguage')
                        ))
                        ->footerContent($isDefaultLanguage ? view(
                            'plugins/contact::partials.custom-field-options-footer',
                            compact('isDefaultLanguage')
                        ) : null)
                );
            });
    }
}
