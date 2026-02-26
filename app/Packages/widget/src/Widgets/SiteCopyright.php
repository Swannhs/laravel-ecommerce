<?php

namespace App\Packages\Widget\Widgets;

use App\Core\Base\Facades\Html;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Packages\Theme\Supports\ThemeSupport;
use App\Packages\Widget\AbstractWidget;
use App\Packages\Widget\Forms\WidgetForm;
use Illuminate\Support\Collection;

class SiteCopyright extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => trans('packages/widget::widget.widget_site_copyright'),
            'description' => trans('packages/widget::widget.widget_site_copyright_description'),
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add(
                'description',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(
                        trans('packages/widget::widget.widget_site_copyright_helper', [
                            'link' => Html::link(route('theme.options'), trans('packages/widget::widget.theme_options')),
                        ])
                    )
            );
    }

    protected function data(): array|Collection
    {
        return [
            'copyright' => ThemeSupport::getSiteCopyright(),
        ];
    }
}
