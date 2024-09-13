<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HolidayController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/holidays/fetch/{country}/{year}', [HolidayController::class, 'fetchHolidays']);
//Route::get('/holidays', [HolidayController::class, 'index']);

Route::get('/holidays/view', [HolidayController::class, 'showView'])->name('holidays.view');
Route::get('/holidays', [HolidayController::class, 'fetchHolidaysview'])->name('holidays.fetch');

 Route::delete('/holidays/{id}', [HolidayController::class, 'destroy']);
 Route::get('/holidays/{id}/edit', [HolidayController::class, 'edit']);
 Route::put('/holidays/{id}', [HolidayController::class, 'update']);

 //Route::get('/calendar', [HolidayController::class, 'showCalendar'])->name('calendar');
 Route::get('/calendar', [HolidayController::class, 'showCalendar'])->name('calendar');

