<?php

namespace App\Plugins\Ecommerce\Forms\Fronts\Auth;

use App\Core\Base\Forms\FieldOptions\ButtonFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\PasswordField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Http\Requests\UpdatePasswordRequest;
use App\Plugins\Ecommerce\Models\Customer;

class ChangePasswordForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Customer::class)
            ->setUrl(route('customer.post.change-password'))
            ->setValidatorClass(UpdatePasswordRequest::class)
            ->contentOnly()
            ->add(
                'old_password',
                PasswordField::class,
                TextFieldOption::make()
                    ->placeholder(__('Current password'))
                    ->label(__('Current password'))
                    ->required()
            )
            ->add(
                'password',
                PasswordField::class,
                TextFieldOption::make()
                    ->placeholder(__('New password'))
                    ->label(__('Password'))
                    ->required()
            )
            ->add(
                'password_confirmation',
                PasswordField::class,
                TextFieldOption::make()
                    ->placeholder(__('Confirm password'))
                    ->label(__('Password confirmation'))
                    ->required()
            )
            ->add(
                'submit',
                'submit',
                ButtonFieldOption::make()
                    ->label(__('Change password'))
                    ->cssClass('btn btn-primary')
            );
    }
}
