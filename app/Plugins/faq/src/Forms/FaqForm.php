<?php

namespace App\Plugins\Faq\Forms;

use App\Core\Base\Forms\FieldOptions\EditorFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\FieldOptions\TextareaFieldOption;
use App\Core\Base\Forms\Fields\EditorField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Faq\Http\Requests\FaqRequest;
use App\Plugins\Faq\Models\Faq;
use App\Plugins\Faq\Models\FaqCategory;

class FaqForm extends FormAbstract
{
    public function setup(): void
    {
        $faqCategories = FaqCategory::query()
            ->pluck(
                'name',
                'id'
            )
            ->all();

        $this
            ->model(Faq::class)
            ->setValidatorClass(FaqRequest::class)
            ->add(
                'category_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/faq::faq.category'))
                    ->choices(['' => trans('plugins/faq::faq.select_category')] + $faqCategories)
                    ->required()
            )
            ->add(
                'question',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(trans('plugins/faq::faq.question'))
                    ->required()
                    ->rows(4)
            )
            ->add(
                'answer',
                EditorField::class,
                EditorFieldOption::make()->label(trans('plugins/faq::faq.answer'))->required()->rows(4)
            )
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
