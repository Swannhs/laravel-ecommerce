<?php

namespace App\Plugins\Testimonial\Forms;

use App\Core\Base\Forms\FieldOptions\ContentFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\EditorField;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Testimonial\Http\Requests\TestimonialRequest;
use App\Plugins\Testimonial\Models\Testimonial;

class TestimonialForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Testimonial::class)
            ->setValidatorClass(TestimonialRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add(
                'company',
                TextField::class,
                TextFieldOption::make()->label(trans('plugins/testimonial::testimonial.company'))->maxLength(
                    120
                )
            )
            ->add('content', EditorField::class, ContentFieldOption::make()->required())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
