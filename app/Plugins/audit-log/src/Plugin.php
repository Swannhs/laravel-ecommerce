<?php

namespace App\Plugins\AuditLog;

use App\Core\Dashboard\Models\DashboardWidget;
use App\Packages\PluginManagement\Abstracts\PluginOperationAbstract;
use App\Packages\Widget\Models\Widget;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('audit_histories');

        Widget::query()
            ->where('widget_id', 'widget_audit_logs')
            ->each(fn (DashboardWidget $dashboardWidget) => $dashboardWidget->delete());
    }
}
