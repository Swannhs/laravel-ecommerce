<?php

namespace App\Packages\Installer\Http\Controllers;

use App\Core\Base\Exceptions\LicenseInvalidException;
use App\Core\Base\Exceptions\LicenseIsAlreadyActivatedException;
use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Supports\Core;
use App\Core\Setting\Facades\Setting;
use App\Core\Setting\Http\Requests\LicenseSettingRequest;
use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Throwable;

class LicenseController extends BaseController
{
    public function index(): View|RedirectResponse
    {
        return view('packages/installer::license');
    }

    public function store(LicenseSettingRequest $request, Core $core): RedirectResponse
    {
        $buyer = $request->input('buyer');

        try {
            $licenseKey = $request->input('purchase_code');

            $core->activateLicense($licenseKey, $buyer);

            $finalUrl = URL::temporarySignedRoute('installers.final', Carbon::now()->addMinutes(30));

            return redirect()->to($finalUrl);
        } catch (LicenseInvalidException | LicenseIsAlreadyActivatedException $exception) {
            throw ValidationException::withMessages([
                'purchase_code' => [$exception->getMessage()],
            ]);
        } catch (Throwable $exception) {
            report($exception);

            throw ValidationException::withMessages([
                'purchase_code' => ['Something went wrong. Please try again later.'],
            ]);
        }
    }

    public function skip(): RedirectResponse
    {
        Core::make()->skipLicenseReminder();

        return redirect()->to(URL::temporarySignedRoute('installers.final', Carbon::now()->addMinutes(30)));
    }
}
