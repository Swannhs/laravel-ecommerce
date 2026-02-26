<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\DatePickerFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\TextareaFieldOption;
use App\Core\Base\Forms\Fields\DatePickerField;
use App\Core\Base\Forms\Fields\EmailField;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\MediaImagesField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\FieldOptions\EmailFieldOption;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use App\Plugins\Ecommerce\Http\Requests\ReviewRequest;
use App\Plugins\Ecommerce\Models\Review;
use Carbon\Carbon;

class ReviewForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Review::class)
            ->setValidatorClass(ReviewRequest::class)
            ->add(
                'product_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::review.product'))
                    ->ajaxSearch()
                    ->required()
                    ->ajaxUrl(route('reviews.ajax-search-products'))
            )
            ->add(
                'customer_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::review.choose_existing_customer'))
                    ->ajaxSearch()
                    ->ajaxUrl(route('reviews.ajax-search-customers'))
                    ->helperText(trans('plugins/ecommerce::review.choose_customer_help'))
            )
            ->add(
                'open_or',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(sprintf(
                        '<div class="form-fieldset"><label class="form-label">%s</label>',
                        trans('plugins/ecommerce::review.or_enter_manually')
                    ))
            )
            ->add(
                'customer_name',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::ecommerce.customer_name'))
            )
            ->add(
                'customer_email',
                EmailField::class,
                EmailFieldOption::make()
                    ->label(trans('plugins/ecommerce::ecommerce.customer_email'))
            )
            ->add(
                'close_or',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('</div>')
            )
            ->add(
                'star',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::review.star'))
                    ->choices(array_combine(range(1, 5), range(1, 5)))
                    ->selected(5)
            )
            ->add(
                'comment',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(trans('plugins/ecommerce::review.comment'))
                    ->required()
            )
            ->add('images[]', MediaImagesField::class, [
                'label' => trans('plugins/ecommerce::review.images'),
                'values' => $this->model->images,
            ])
            ->add(
                'created_at',
                DatePickerField::class,
                DatePickerFieldOption::make()
                    ->label(trans('core/base::tables.created_at'))
                    ->value(Carbon::now())
                    ->withTimePicker()
            )
            ->setBreakFieldPoint('created_at');
    }
}
