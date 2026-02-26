<?php

namespace App\Plugins\Blog\Forms;

use App\Core\Base\Forms\FieldOptions\ContentFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\EditorField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Blog\Http\Requests\TagRequest;
use App\Plugins\Blog\Models\Tag;

class TagForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Tag::class)
            ->setValidatorClass(TagRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required()->maxLength(120))
            ->add('description', EditorField::class, ContentFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
