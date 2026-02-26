<?php

namespace App\Plugins\Ecommerce\Forms\Fronts\Auth;

use App\Core\Base\Facades\Html;
use App\Core\Base\Forms\FieldOptions\CheckboxFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\Fields\EmailField;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Base\Forms\Fields\PasswordField;
use App\Core\Base\Forms\Fields\PhoneNumberField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\FieldOptions\EmailFieldOption;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\FieldOptions\PhoneNumberFieldOption;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use App\Plugins\Ecommerce\Http\Requests\RegisterRequest;
use App\Plugins\Ecommerce\Models\Customer;
use App\Packages\Theme\Facades\Theme;

class RegisterForm extends AuthForm
{
    public static function formTitle(): string
    {
        return __('Customer register form');
    }

    public function setup(): void
    {
        parent::setup();

        $this
            ->setUrl(route('customer.register.post'))
            ->setValidatorClass(RegisterRequest::class)
            ->icon('ti ti-user-plus')
            ->heading(__('Register an account'))
            ->description(__('Your personal data will be used to support your experience throughout this website, to manage access to your account.'))
            ->when(
                theme_option('register_background'),
                fn (AuthForm $form, string $background) => $form->banner($background)
            )
            ->add(
                'name',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Full name'))
                    ->placeholder(__('Your full name'))
                    ->required()
                    ->icon('ti ti-user')
            )
            ->when(! EcommerceHelper::isLoginUsingPhone() || get_ecommerce_setting('keep_email_field_in_registration_form', true), function (FormAbstract $form): void {
                $form
                    ->add(
                        'email',
                        EmailField::class,
                        EmailFieldOption::make()
                            ->label(__('Email'))
                            ->when(EcommerceHelper::isLoginUsingPhone(), function (EmailFieldOption $fieldOption): void {
                                $fieldOption->label(__('Email (optional)'));
                            }, function (EmailFieldOption $fieldOption): void {
                                $fieldOption->required();
                            })
                            ->placeholder(__('Your email'))
                            ->icon('ti ti-mail')
                            ->addAttribute('autocomplete', 'email')
                    );
            })
            ->when(get_ecommerce_setting('enabled_phone_field_in_registration_form', true), static function (FormAbstract $form): void {
                $form
                    ->add(
                        'phone',
                        PhoneNumberField::class,
                        PhoneNumberFieldOption::make()
                            ->label(__('Phone (optional)'))
                            ->when(EcommerceHelper::isLoginUsingPhone() || get_ecommerce_setting('make_customer_phone_number_required', false), static function (PhoneNumberFieldOption $fieldOption): void {
                                $fieldOption
                                    ->required()
                                    ->label(__('Phone'));
                            })
                            ->when(! setting('phone_number_enable_country_code', true), function (PhoneNumberFieldOption $fieldOption) {
                                return $fieldOption->icon('ti ti-phone');
                            })
                            ->placeholder(__('Phone number'))
                            ->addAttribute('autocomplete', 'tel')
                            ->withCountryCodeSelection()
                    );
            })
            ->add(
                'password',
                PasswordField::class,
                TextFieldOption::make()
                    ->label(__('Password'))
                    ->placeholder(__('Password'))
                    ->icon('ti ti-lock')
                    ->required()
            )
            ->add(
                'password_confirmation',
                PasswordField::class,
                TextFieldOption::make()
                    ->label(__('Password confirmation'))
                    ->placeholder(__('Password confirmation'))
                    ->icon('ti ti-lock')
                    ->required()
            )
            ->add(
                'agree_terms_and_policy',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->when(
                        $privacyPolicyUrl = Theme::termAndPrivacyPolicyUrl(),
                        function (CheckboxFieldOption $fieldOption, string $url): void {
                            $fieldOption->label(__('I agree to the :link', ['link' => Html::link($url, __('Terms and Privacy Policy'), attributes: ['class' => 'text-decoration-underline', 'target' => '_blank'])]));
                        }
                    )
                    ->when(! $privacyPolicyUrl, function (CheckboxFieldOption $fieldOption): void {
                        $fieldOption->label(__('I agree to the Terms and Privacy Policy'));
                    })
            )
            ->submitButton(__('Register'), 'ti ti-arrow-narrow-right')
            ->add(
                'login',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('plugins/ecommerce::customers.includes.login-link')
            )
            ->add('filters', HtmlField::class, [
                'html' => apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, Customer::class),
            ]);
    }
}
