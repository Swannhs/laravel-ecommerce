<?php

namespace App\Plugins\Translation\Http\Controllers;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Supports\Breadcrumb;
use App\Core\Setting\Http\Controllers\SettingController;
use App\Plugins\Translation\Http\Controllers\Concerns\HasMapTranslationsTable;
use App\Plugins\Translation\Http\Requests\TranslationRequest;
use App\Plugins\Translation\Manager;
use App\Plugins\Translation\Tables\TranslationTable;
use Illuminate\Http\Request;

class TranslationController extends SettingController
{
    use HasMapTranslationsTable;

    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/translation::translation.localization'));
    }

    public function __construct(protected Manager $manager)
    {
    }

    public function index(Request $request, TranslationTable $translationTable)
    {
        $this->pageTitle(trans('plugins/translation::translation.admin-translations'));

        Assets::addScriptsDirectly('vendor/core/plugins/translation/js/translation.js')
            ->addStylesDirectly('vendor/core/plugins/translation/css/translation.css');

        [$locales, $locale, $defaultLanguage, $translationTable]
            = $this->mapTranslationsTable($translationTable, $request);

        if ($request->expectsJson()) {
            return $translationTable->renderTable();
        }

        return view(
            'plugins/translation::index',
            compact('locales', 'locale', 'defaultLanguage', 'translationTable')
        );
    }

    public function update(TranslationRequest $request)
    {
        $group = $request->input('group');

        $name = $request->input('name');
        $value = $request->input('value');

        [$locale, $key] = explode('|', $name, 2);

        $this->manager->updateTranslation($locale, $group, $key, $value);

        return $this->httpResponse();
    }
}
