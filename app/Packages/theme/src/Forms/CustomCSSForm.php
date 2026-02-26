<?php

namespace App\Packages\Theme\Forms;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\FieldOptions\CodeEditorFieldOption;
use App\Core\Base\Forms\Fields\CodeEditorField;
use App\Core\Base\Forms\FormAbstract;
use App\Packages\Theme\Facades\Theme;
use App\Packages\Theme\Http\Requests\CustomCssRequest;
use Illuminate\Support\Facades\File;

class CustomCSSForm extends FormAbstract
{
    public function setup(): void
    {
        $css = null;
        $file = Theme::getStyleIntegrationPath();

        if (File::exists($file)) {
            $css = BaseHelper::getFileData($file, false);
        }

        $this
            ->setUrl(route('theme.custom-css.post'))
            ->setValidatorClass(CustomCssRequest::class)
            ->setActionButtons(view('core/base::forms.partials.form-actions', ['onlySave' => true])->render())
            ->add(
                'custom_css',
                CodeEditorField::class,
                CodeEditorFieldOption::make()
                    ->label(trans('packages/theme::theme.custom_css'))
                    ->value($css)
                    ->mode('css')
                    ->maxLength(100000)
            );
    }
}
