<?php

namespace App\Plugins\Ecommerce\Forms\Fronts\Auth;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Packages\Theme\Facades\Theme;
use App\Packages\Theme\FormFront;

abstract class AuthForm extends FormFront
{
    public function setup(): void
    {
        Theme::asset()->add('auth-css', 'vendor/core/plugins/ecommerce/css/front-auth.css', version: EcommerceHelper::getAssetVersion());

        Theme::addBodyAttributes(['id' => 'page-auth']);

        $this
            ->contentOnly()
            ->template('plugins/ecommerce::customers.forms.auth');
    }

    public function submitButton(string $label, ?string $icon = null, string $iconPosition = 'append'): static
    {
        $iconHtml = $icon ? BaseHelper::renderIcon($icon) : '';

        return $this
            ->add('openButtonWrap', HtmlField::class, [
                'html' => '<div class="d-grid">',
            ])
            ->add('submit', 'submit', [
                'label' =>
                    ($icon && $iconPosition === 'prepend' ? $iconHtml : '')
                    . $label
                    . ($icon && $iconPosition === 'append' ? $iconHtml : ''),
                'attr' => [
                    'class' => 'btn btn-primary btn-auth-submit',
                ],
            ])
            ->add('closeButtonWrap', HtmlField::class, [
                'html' => '</div>',
            ])
            ->setFormEndKey('openButtonWrap');
    }

    public function banner(string $banner): static
    {
        return $this->setFormOption('banner', $banner);
    }

    public function bannerDirection(string $direction): static
    {
        return $this->setFormOption('bannerDirection', $direction);
    }

    public function icon(string $icon): static
    {
        return $this->setFormOption('icon', $icon);
    }

    public function heading(string $heading): static
    {
        return $this->setFormOption('heading', $heading);
    }

    public function description(string $description): static
    {
        return $this->setFormOption('description', $description);
    }

    public function ignoreBaseTemplate(): static
    {
        $this
            ->banner('')
            ->icon('')
            ->heading('')
            ->description('')
            ->contentOnly();

        return $this;
    }
}
