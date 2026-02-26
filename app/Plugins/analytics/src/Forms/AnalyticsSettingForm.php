<?php

namespace App\Plugins\Analytics\Forms;

use App\Plugins\Analytics\Http\Requests\Settings\AnalyticsSettingRequest;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Core\Base\Forms\FieldOptions\AlertFieldOption;
use App\Core\Base\Forms\FieldOptions\CodeEditorFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\AlertField;
use App\Core\Base\Forms\Fields\CodeEditorField;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Setting\Forms\SettingForm;

class AnalyticsSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        Assets::addScriptsDirectly('vendor/core/plugins/analytics/js/settings.js');

        $this
            ->setSectionTitle(trans('plugins/analytics::analytics.settings.title'))
            ->setSectionDescription(trans('plugins/analytics::analytics.settings.description'))
            ->setFormOption('id', 'google-analytics-settings')
            ->setValidatorClass(AnalyticsSettingRequest::class)
            ->setActionButtons(view('core/setting::forms.partials.action', ['form' => $this->getFormOption('id')])->render())
            ->add(
                'analytics_dashboard_widgets',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/analytics::analytics.settings.enable_dashboard_widgets'))
                    ->value($targetValue = old('analytics_dashboard_widgets', setting('analytics_dashboard_widgets', 0)))
            )
            ->addOpenCollapsible('analytics_dashboard_widgets', '1', $targetValue)
            ->add(
                'analytics_property_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/analytics::analytics.settings.analytics_property_id'))
                    ->value(setting('analytics_property_id'))
                    ->placeholder(trans('plugins/analytics::analytics.settings.analytics_property_id_description'))
                    ->helperText(
                        Html::link(
                            'https://developers.google.com/analytics/devguides/reporting/data/v1/property-id',
                            attributes: ['target' => '_blank']
                        )
                    )
            )
            ->when(! BaseHelper::hasDemoModeEnabled(), function (AnalyticsSettingForm $form): void {
                $form
                    ->add(
                        'analytics_service_account_credentials',
                        CodeEditorField::class,
                        CodeEditorFieldOption::make()
                            ->label(trans('plugins/analytics::analytics.settings.json_credential'))
                            ->placeholder(trans('plugins/analytics::analytics.settings.json_credential_description'))
                            ->value(setting('analytics_service_account_credentials'))
                            ->mode('javascript')
                            ->helperText(
                                Html::link(
                                    'https://github.com/akki-io/laravel-google-analytics/wiki/2.-Configure-Google-Service-Account-&-Google-Analytics',
                                    attributes: ['target' => '_blank']
                                )
                            )
                    )
                    ->add(
                        'upload_account_json_file',
                        HtmlField::class,
                        HtmlFieldOption::make()->view('plugins/analytics::upload-button')
                    );
            })
            ->addCloseCollapsible('analytics_dashboard_widgets', '1');

        $this->add(
            'google_analytics_info',
            AlertField::class,
            AlertFieldOption::make()
                ->type('info')
                ->content(trans('plugins/analytics::analytics.settings.google_analytics_information'))
        );

    }
}
