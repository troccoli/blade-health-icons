<?php

namespace Troccoli\BladeHealthIcons;

use BladeUI\Icons\Factory;
use Illuminate\Contracts\Container\Container;
use Illuminate\Support\ServiceProvider;

class BladeHealthIconsServiceProvider extends ServiceProvider
{
    public function register() : void
    {
        $this->registerConfig();

        $this->callAfterResolving(Factory::class, function (Factory $factory, Container $container) {
            $config = $container->make('config')->get('blade-health-icons', []);

            $factory->add('health-icons', array_merge(['path' => __DIR__ . '/../resources/svg'], $config));
        });
    }

    private function registerConfig() : void
    {
        $this->mergeConfigFrom(__DIR__ . '/../config/blade-health-icons.php', 'blade-health-icons');
    }

    public function boot() : void
    {
        if ($this->app->runningInConsole()) {
            $this->publishes([
                __DIR__ . '/../resources/svg' => public_path('vendor/blade-health-icons'),
            ], 'blade-health-icons');

            $this->publishes([
                __DIR__ . '/../config/blade-health-icons.php' => $this->app->configPath('blade-health-icons.php'),
            ], 'blade-health-icons-config');
        }
    }
}