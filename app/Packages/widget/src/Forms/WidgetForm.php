<?php

namespace App\Packages\Widget\Forms;

use App\Core\Base\Forms\FieldOptions\AlertFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\Fields\AlertField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\FormAbstract;
use App\Core\Base\Models\BaseModel;
use App\Packages\Widget\AbstractWidget;

class WidgetForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(BaseModel::class)
            ->contentOnly();
    }

    public function renderForm(
        array $options = [],
        bool $showStart = false,
        bool $showFields = true,
        bool $showEnd = false
    ): string {
        return parent::renderForm($options, $showStart, $showFields, $showEnd);
    }

    public function withCaching(bool $caching = true): static
    {
        if (! $caching) {
            $this->remove('enable_caching');

            return $this;
        }

        if (! setting('widget_cache_enabled', false)) {
            return $this;
        }

        $this
            ->remove('enable_caching')
            ->add(
                'enable_caching',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('packages/widget::widget.form.enable_caching'))
                    ->choices([
                        'yes' => trans('packages/widget::widget.form.yes'),
                        'no' => trans('packages/widget::widget.form.no'),
                    ])
                    ->helperText(trans('packages/widget::widget.form.cache_helper'))
            );

        return $this;
    }

    public function withCacheWarning(string $widgetClass): static
    {
        if (in_array($widgetClass, AbstractWidget::getIgnoredCaches())) {
            $this
                ->remove('enable_caching')
                ->add(
                    'cache_warning',
                    AlertField::class,
                    AlertFieldOption::make()
                        ->type('warning')
                        ->content(trans('packages/widget::widget.form.cache_warning'))
                );
        }

        return $this;
    }
}
