<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\Attendance\CheckInController;
use App\Http\Controllers\Backend\Attendance\RegularizationControler;

Route::group(['middleware' => ['xss','auth', 'TimeZone', 'MaintenanceMode'], 'prefix' => 'dashboard'], function () {
    // check in ajax
    Route::get('ajax-checkin-modal',  [CheckInController::class, 'dashboardAjaxCheckinModal'])->name('admin.ajaxDashboardCheckinModal');
    Route::get('ajax-checkin',        [CheckInController::class, 'dashboardAjaxCheckin'])->name('admin.ajaxDashboardCheckin');

    Route::get('ajax-checkout-modal', [CheckInController::class, 'ajaxDashboardCheckOutModal'])->name('admin.ajaxDashboardCheckOutModal');
    Route::get('ajax-checkout',       [CheckInController::class, 'ajaxDashboardCheckOut'])->name('admin.ajaxDashboardCheckOut');
    // check in ajax

    //checkin regularization
    Route::get('ajax-regularization-modal',  [RegularizationControler::class, 'dashboardAjaxRegularizationModal'])->name('admin.ajaxDashboardRegularizationModal');
    Route::get('ajax-regularization', [RegularizationControler::class, 'dashboardAjaxRegularization'])->name('admin.ajaxRegularization');
      // take break ajax
      Route::get('ajax-break-modal',  [CheckInController::class, 'dashboardAjaxBreakModal'])->name('admin.ajaxDashboardBreakModal');
      Route::post('ajax-break',        [CheckInController::class, 'dashboardAjaxBreak'])->name('admin.ajaxDashboardBreak');
      Route::get('ajax-break-back',        [CheckInController::class, 'ajaxDashboardBreakModalBack'])->name('admin.ajaxDashboardBreakModal_Back');
});