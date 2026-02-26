<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Customers;

use App\Core\ACL\Traits\SendsPasswordResetEmails;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\ForgotPasswordForm;
use App\Packages\SeoHelper\Facades\SeoHelper;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Support\Facades\Password;

class ForgotPasswordController extends BaseController
{
    use SendsPasswordResetEmails;

    public function __construct()
    {
        $this->middleware('customer.guest');
    }

    public function showLinkRequestForm()
    {
        SeoHelper::setTitle(__('Forgot Password'));

        Theme::breadcrumb()
            ->add(__('Login'), route('customer.password.reset'));

        return Theme::scope(
            'ecommerce.customers.passwords.email',
            ['form' => ForgotPasswordForm::create()],
            'plugins/ecommerce::themes.customers.passwords.email'
        )->render();
    }

    public function broker(): PasswordBroker
    {
        return Password::broker('customers');
    }
}
