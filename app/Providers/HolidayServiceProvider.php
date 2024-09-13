<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
//use App\Services\HolidayService;

class HolidayServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        // $this->app->bind(HolidayService::class, function ($app) {
        //     return new HolidayService();
        // });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
