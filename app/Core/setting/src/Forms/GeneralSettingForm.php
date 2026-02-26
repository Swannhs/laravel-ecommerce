<?php

namespace App\Core\Setting\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Setting\Http\Requests\GeneralSettingRequest;
use DateTimeZone;

class GeneralSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        Assets::usingVueJS()
            ->addStylesDirectly('vendor/core/core/setting/css/admin-email.css')
            ->addScriptsDirectly([
                'vendor/core/core/setting/js/admin-email.js',
                'vendor/core/core/setting/js/license-component.js',
            ]);

        $this
            ->setSectionTitle(trans('core/setting::setting.general.title'))
            ->setSectionDescription(trans('core/setting::setting.general.description'))
            ->contentOnly()
            ->setValidatorClass(GeneralSettingRequest::class)
            ->add(
                'admin_email',
                HtmlField::class,
                HtmlFieldOption::make()->view('core/setting::partials.admin-email-field')
            )
            ->add(
                'time_zone',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('core/setting::setting.general.time_zone'))
                    ->choices(array_combine(DateTimeZone::listIdentifiers(), DateTimeZone::listIdentifiers()))
                    ->selected(setting('time_zone', 'UTC'))
                    ->searchable()
                    ->helperText(trans('core/setting::setting.general.time_zone_helper'))
            )
            ->add(
                'enable_send_error_reporting_via_email',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/setting::setting.general.enable_send_error_reporting_via_email'))
                    ->value(setting('enable_send_error_reporting_via_email'))
                    ->helperText(trans('core/setting::setting.general.enable_send_error_reporting_via_email_helper'))
            )
            ->when(
                apply_filters(BASE_FILTER_AFTER_SETTING_CONTENT, null),
                function (GeneralSettingForm $form, $settingContent): void {
                    $form
                        ->add(
                            'html',
                            HtmlField::class,
                            HtmlFieldOption::make()
                                ->content('</div></div><div class="card mt-3 overflow-hidden"><div class="card-body">' . $settingContent)
                        );
                }
            );
    }
}
