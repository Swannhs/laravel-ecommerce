<?php

namespace App\Core\Base\Supports;

use App\Core\Base\Events\EditorAssetRegistered;
use App\Core\Base\Events\EditorAssetRegistering;
use App\Core\Base\Events\EditorRendered;
use App\Core\Base\Events\EditorRendering;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\BaseHelper;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\App;

class Editor
{
    public function registerAssets(): self
    {
        EditorAssetRegistering::dispatch();

        Assets::addScriptsDirectly(config('core.base.general.editor.' . BaseHelper::getRichEditor() . '.js'))
            ->addScriptsDirectly('vendor/core/core/base/js/editor.js');

        $locale = App::getLocale();

        if (BaseHelper::getRichEditor() == 'ckeditor' && $locale != 'en') {
            Assets::addScriptsDirectly(
                sprintf('https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/translations/%s.js', $locale)
            );
        }

        return tap($this, fn () => EditorAssetRegistered::dispatch());
    }

    public function render(string $name, $value = null, bool $withShortcode = false, array $attributes = []): string
    {
        EditorRendering::dispatch($name, $value, $withShortcode, $attributes);

        $attributes['class'] = Arr::get($attributes, 'class', '') . ' editor-' . BaseHelper::getRichEditor();

        $attributes['id'] = Arr::has($attributes, 'id') ? $attributes['id'] : $name;
        $attributes['with-short-code'] = $withShortcode;
        $attributes['rows'] = Arr::get($attributes, 'rows', 4);

        $rendered = view('core/base::forms.partials.editor', compact('name', 'value', 'attributes'))->render();

        return tap(
            apply_filters('base_filter_editor_rendered', $rendered),
            fn (string $rendered) => EditorRendered::dispatch($rendered, $name, $value, $withShortcode, $attributes)
        );
    }
}
