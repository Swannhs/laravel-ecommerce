<?php

namespace App\Core\Base\Http\Controllers;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Supports\Core;
use App\Core\Base\Supports\SystemManagement;
use App\Core\Base\Tables\InfoTable;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class SystemInformationController extends BaseSystemController
{
    public function index(Request $request, InfoTable $infoTable, Core $core)
    {
        $this->pageTitle(trans('core/base::system.info.title'));

        Assets::addScriptsDirectly('vendor/core/core/base/js/system-info.js');

        $composerArray = SystemManagement::getComposerArray();
        $packages = SystemManagement::getPackagesAndDependencies($composerArray['require']);

        if ($request->expectsJson()) {
            return $infoTable->renderTable();
        }

        $systemEnv = SystemManagement::getSystemEnv();
        $serverEnv = SystemManagement::getServerEnv();
        $databaseInfo = SystemManagement::getDatabaseInfo();

        $requiredPhpVersion = Arr::get($composerArray, 'require.php', get_minimum_php_version());
        $requiredPhpVersion = str_replace('^', '', $requiredPhpVersion);
        $requiredPhpVersion = str_replace('~', '', $requiredPhpVersion);

        $matchPHPRequirement = version_compare(phpversion(), $requiredPhpVersion, '>=') > 0;

        $serverIp = $core->getServerIP();

        return view(
            'core/base::system.info',
            compact(
                'packages',
                'infoTable',
                'systemEnv',
                'serverEnv',
                'databaseInfo',
                'matchPHPRequirement',
                'requiredPhpVersion',
                'serverIp',
            )
        );
    }

    public function getAdditionData()
    {
        BaseHelper::maximumExecutionTimeAndMemoryLimit();

        $appSize = BaseHelper::humanFilesize(SystemManagement::getAppSize());

        return $this
            ->httpResponse()
            ->setData(compact('appSize'));
    }
}
