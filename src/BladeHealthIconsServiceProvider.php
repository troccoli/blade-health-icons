<?php

namespace Troccoli\BladeHealthIcons;

use BladeUI\Icons\Factory;
use Illuminate\Support\ServiceProvider;

class BladeHealthIconsServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->registerConfig();

        $this->callAfterResolving(Factory::class, function (Factory $factory) {
            $factory->add('health-icons', [
                'path' => __DIR__.'/../resources/svg',
                'prefix' => config('blade-health-icons.prefix'),
            ]);
        });
    }

    public function boot(): void
    {
        if ($this->app->runningInConsole()) {
            $this->publishes([
                __DIR__.'/../resources/svg' => public_path('vendor/blade-health-icons'),
            ], 'blade-health-icons');

            $this->publishes([
                __DIR__.'/../config/blade-health-icons.php' => $this->app->configPath('blade-health-icons.php'),
            ], 'blade-health-icons-config');
        }
    }

    private function registerConfig(): void
    {
        $this->mergeConfigFrom(__DIR__.'/../config/blade-health-icons.php', 'blade-health-icons');
    }
}
