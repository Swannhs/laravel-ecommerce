<?php

namespace App\Core\ACL\Http\Controllers\Auth;

use App\Core\ACL\Forms\Auth\ResetPasswordForm;
use App\Core\ACL\Traits\ResetsPasswords;
use App\Core\Base\Http\Controllers\BaseController;
use Illuminate\Http\Request;

class ResetPasswordController extends BaseController
{
    use ResetsPasswords;

    protected string $redirectTo = '/';

    public function __construct()
    {
        $this->middleware('guest');

        $this->redirectTo = route('dashboard.index');
    }

    public function showResetForm(Request $request, $token = null)
    {
        $this->pageTitle(trans('core/acl::auth.reset.title'));

        return ResetPasswordForm::create()->renderForm();
    }
}
