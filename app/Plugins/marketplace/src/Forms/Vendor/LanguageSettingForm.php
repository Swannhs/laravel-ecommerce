<?php

namespace App\Plugins\Marketplace\Forms\Vendor;

use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\FormAbstract;
use App\Core\Base\Supports\Language;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Marketplace\Forms\Concerns\HasSubmitButton;
use App\Plugins\Marketplace\Http\Requests\Vendor\LanguageSettingRequest;
use Illuminate\Support\Facades\App;

class LanguageSettingForm extends FormAbstract
{
    use HasSubmitButton;

    public function setup(): void
    {
        $languages = Language::getAvailableLocales();

        $this
            ->setupModel(new Customer())
            ->setValidatorClass(LanguageSettingRequest::class)
            ->setUrl(route('marketplace.vendor.language-settings.update'))
            ->setMethod('PUT')
            ->contentOnly()
            ->when(count($languages) > 1, function (FormAbstract $form) use ($languages): void {
                $languages = collect($languages)
                    ->pluck('name', 'locale')
                    ->map(fn ($item, $key) => $item . ' - ' . $key)
                    ->all();

                $form
                    ->add(
                        'locale',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(trans('plugins/marketplace::marketplace.language'))
                            ->choices($languages)
                            ->selected($form->getModel()->getMetaData('locale', 'true') ?: App::getLocale())
                            ->metadata()
                    );
            })
            ->addSubmitButton(trans('plugins/marketplace::marketplace.save_settings'));
    }
}
