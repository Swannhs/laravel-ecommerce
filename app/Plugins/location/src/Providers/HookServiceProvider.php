<?php

namespace App\Plugins\Location\Providers;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FormAbstract;
use App\Core\Base\Forms\FormHelper;
use App\Core\Base\Supports\ServiceProvider;
use App\Packages\DataSynchronize\Importer\Importer;
use App\Plugins\Location\Facades\Location;
use App\Plugins\Location\Fields\SelectLocationField;
use App\Plugins\Location\Importers\LocationImporter;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app->booted(function (): void {
            add_filter('form_custom_fields', function (FormAbstract $form, FormHelper $formHelper) {
                if (! $formHelper->hasCustomField('selectLocation')) {
                    $form->addCustomField('selectLocation', SelectLocationField::class);
                }

                return $form;
            }, 29, 2);

            add_filter('data_synchronize_import_page_before', function (?string $html, Importer $importer) {
                if (! $importer instanceof LocationImporter) {
                    return $html;
                }

                Assets::addScriptsDirectly('vendor/core/plugins/location/js/bulk-import.js');
                $countries = Location::getAvailableCountries();

                return $html . view('plugins/location::partials.import-available-data', compact('countries'))->render();
            }, 980, 2);

            add_filter('data_synchronize_import_form_after', function (?string $html, Importer $importer): ?string {
                if (! $importer instanceof LocationImporter) {
                    return $html;
                }

                return $html . view('plugins/location::partials.location-import-extra-fields')->render();
            }, 990, 2);
        });
    }
}
