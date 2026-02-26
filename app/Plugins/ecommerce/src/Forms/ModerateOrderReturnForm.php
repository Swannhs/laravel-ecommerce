<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\ButtonFieldOption;
use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\FormAbstract;

class ModerateOrderReturnForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->contentOnly()
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add(
                'button_wrapper',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('<div class="d-flex gap-2 justify-content-end">')
            )
            ->add(
                'close',
                'button',
                ButtonFieldOption::make()
                    ->label(trans('core/base::base.close'))
                    ->cssClass('btn')
                    ->addAttribute('data-bs-dismiss', 'modal')
            )
            ->add(
                'button_wrapper_close',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content('</div>')
            );
    }

    public function addHiddenStatus(string $status): self
    {
        return $this->addBefore(
            'description',
            'return_status',
            'hidden',
            TextFieldOption::make()
                ->value($status)
        );
    }

    public function addSubmitButton(string $title, string $color): self
    {
        return $this->addAfter(
            'close',
            'submit',
            'submit',
            ButtonFieldOption::make()
                ->label($title)
                ->cssClass("btn btn-$color btn-update-order")
        );
    }
}
