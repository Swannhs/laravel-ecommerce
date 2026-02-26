<?php

namespace App\Packages\Installer\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Packages\Installer\Http\Controllers\Concerns\InteractsWithDatabaseFile;
use App\Packages\Installer\Http\Requests\ChooseThemeRequest;
use App\Packages\Installer\InstallerStep\InstallerStep;
use App\Packages\Installer\Services\ImportDatabaseService;
use Carbon\Carbon;
use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class ThemeController extends BaseController
{
    use InteractsWithDatabaseFile;

    public function __construct()
    {
        $this->middleware(function (Request $request, Closure $next) {
            abort_if(! InstallerStep::hasMoreThemes(), 404);

            return $next($request);
        });
    }

    public function index(Request $request): View|RedirectResponse
    {
        if (! URL::hasValidSignature($request)) {
            return redirect()->route('installers.requirements.index');
        }

        $themes = InstallerStep::getThemes();

        return view('packages/installer::theme', compact('themes'));
    }

    public function store(ChooseThemeRequest $request, ImportDatabaseService $importDatabaseService): RedirectResponse
    {
        InstallerStep::setCurrentTheme($request->input('theme'));

        if (InstallerStep::hasMoreThemePresets()) {
            return redirect()
                ->to(URL::temporarySignedRoute('installers.theme-presets.index', Carbon::now()->addMinutes(30)));
        }

        $this->handleImportDatabaseFile($importDatabaseService, $request->input('theme'));

        return redirect()
            ->to(URL::temporarySignedRoute('installers.accounts.index', Carbon::now()->addMinutes(30)));
    }
}
