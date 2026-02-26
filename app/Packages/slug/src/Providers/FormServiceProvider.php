<?php

namespace App\Packages\Slug\Providers;

use App\Core\Base\Facades\Form;
use App\Core\Base\Supports\ServiceProvider;

class FormServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app->booted(function (): void {
            Form::component('permalink', 'packages/slug::permalink', [
                'name',
                'value' => null,
                'id' => null,
                'prefix' => '',
                'preview' => false,
                'attributes' => [],
                'editable' => true,
                'model' => '',
            ]);
        });
    }
}
