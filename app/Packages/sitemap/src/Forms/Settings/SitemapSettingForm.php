<?php

namespace App\Packages\Sitemap\Forms\Settings;

use App\Core\Base\Forms\FieldOptions\CheckboxFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\NumberFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Setting\Forms\SettingForm;
use App\Packages\Sitemap\Http\Requests\SitemapSettingRequest;

class SitemapSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('packages/sitemap::sitemap.settings.title'))
            ->setSectionDescription(trans('packages/sitemap::sitemap.settings.description'))
            ->setValidatorClass(SitemapSettingRequest::class)
            ->add(
                'sitemap_enabled',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('packages/sitemap::sitemap.settings.enable_sitemap'))
                    ->value($sitemapEnabled = setting('sitemap_enabled', true))
                    ->helperText(trans('packages/sitemap::sitemap.settings.enable_sitemap_help', ['url' => url('sitemap.xml')]))
            )
            ->addOpenCollapsible('sitemap_enabled', '1', $sitemapEnabled)
            ->add(
                'sitemap_info',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(view('packages/sitemap::partials.sitemap-info')->render())
            )
            ->add(
                'sitemap_items_per_page',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(trans('packages/sitemap::sitemap.settings.sitemap_items_per_page'))
                    ->value(setting('sitemap_items_per_page', 1000))
                    ->helperText(trans('packages/sitemap::sitemap.settings.sitemap_items_per_page_help'))
                    ->min(10)
                    ->max(100000)
            )
            ->add(
                'indexnow_enabled',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('packages/sitemap::sitemap.settings.indexnow_enabled'))
                    ->value($indexNowEnabled = setting('indexnow_enabled', 0))
                    ->helperText(trans('packages/sitemap::sitemap.settings.indexnow_enabled_help'))
            )
            ->addOpenCollapsible('indexnow_enabled', '1', $indexNowEnabled)
            ->add(
                'indexnow_api_key',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('packages/sitemap::sitemap.settings.indexnow_api_key'))
                    ->value(setting('indexnow_api_key'))
                    ->helperText(trans('packages/sitemap::sitemap.settings.indexnow_api_key_help'))
                    ->placeholder('xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx')
            )
            ->add(
                'indexnow_info',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(view('packages/sitemap::partials.indexnow-info')->render())
            )
            ->addCloseCollapsible('indexnow_enabled', '1')
            ->addCloseCollapsible('sitemap_enabled', '1');
    }
}
