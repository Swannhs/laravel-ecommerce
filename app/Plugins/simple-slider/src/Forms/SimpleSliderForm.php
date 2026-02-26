<?php

namespace App\Plugins\SimpleSlider\Forms;

use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\SimpleSlider\Http\Requests\SimpleSliderRequest;
use App\Plugins\SimpleSlider\Models\SimpleSlider;
use App\Plugins\SimpleSlider\Tables\SimpleSliderItemTable;
use App\Core\Table\TableBuilder;

class SimpleSliderForm extends FormAbstract
{
    public function __construct(protected TableBuilder $tableBuilder)
    {
        parent::__construct();
    }

    public function setup(): void
    {
        $this
            ->model(SimpleSlider::class)
            ->setValidatorClass(SimpleSliderRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add(
                'key',
                TextField::class,
                TextFieldOption::make()
                ->label(trans('plugins/simple-slider::simple-slider.key'))
                ->required()
                ->maxLength(120)
            )
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status')
            ->when($this->model->id, function (): void {
                $this->addMetaBoxes([
                    'slider-items' => [
                        'title' => trans('plugins/simple-slider::simple-slider.slide_items'),
                        'content' => $this->tableBuilder->create(SimpleSliderItemTable::class)
                            ->setAjaxUrl(route(
                                'simple-slider-item.index',
                                $this->getModel()->id ?: 0
                            ))
                            ->renderTable([
                                'simple_slider_id' => $this->getModel()->getKey(),
                            ]),
                        'header_actions' => view('plugins/simple-slider::partials.header-actions', [
                            'slider' => $this->getModel(),
                        ])->render(),
                        'has_table' => true,
                    ],
                ]);
            });
    }
}
