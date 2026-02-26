<?php

namespace App\Plugins\Newsletter\Forms\Fronts;

use App\Core\Base\Forms\FieldOptions\ButtonFieldOption;
use App\Core\Base\Forms\FieldOptions\EmailFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\Fields\EmailField;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Plugins\Newsletter\Http\Requests\NewsletterRequest;
use App\Plugins\Newsletter\Models\Newsletter;
use App\Packages\Theme\FormFront;

class NewsletterForm extends FormFront
{
    protected string $errorBag = 'newsletter';

    public static function formTitle(): string
    {
        return trans('plugins/newsletter::newsletter.newsletter_form');
    }

    public function setup(): void
    {
        $this
            ->contentOnly()
            ->setUrl(route('public.newsletter.subscribe'))
            ->setFormOption('class', 'subscribe-form')
            ->setValidatorClass(NewsletterRequest::class)
            ->model(Newsletter::class)
            ->add('wrapper_before', HtmlField::class, HtmlFieldOption::make()->content('<div class="input-group mb-3">'))
            ->add(
                'email',
                EmailField::class,
                EmailFieldOption::make()
                    ->label(false)
                    ->required()
                    ->cssClass('')
                    ->wrapperAttributes(false)
                    ->maxLength(-1)
                    ->placeholder(trans('plugins/newsletter::newsletter.enter_your_email'))
                    ->addAttribute('id', 'newsletter-email')
            )
            ->add(
                'submit',
                'submit',
                ButtonFieldOption::make()
                    ->label(trans('plugins/newsletter::newsletter.subscribe'))
                    ->cssClass('btn btn-primary'),
            )
            ->add('wrapper_after', HtmlField::class, HtmlFieldOption::make()->content('</div>'))
            ->add(
                'messages',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(<<<'HTML'
                        <div class="newsletter-message newsletter-success-message" style="display: none"></div>
                        <div class="newsletter-message newsletter-error-message" style="display: none"></div>
                    HTML)
            );
    }
}
