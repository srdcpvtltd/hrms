<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Database\Seeders\GoalSeeder;
use Database\Seeders\AwardSeeder;
use Database\Seeders\LeaveSeeder;
use Database\Seeders\BranchSeeder;
use Database\Seeders\ModuleSeeder;
use Database\Seeders\NoticeSeeder;
use Database\Seeders\UploadSeeder;
use Illuminate\Support\Facades\DB;
use Database\Seeders\ExpenseSeeder;
use Database\Seeders\FeatureSeeder;
use Database\Seeders\PayrollSeeder;
use Illuminate\Support\Facades\Log;
use Database\Seeders\Hrm\TeamSeeder;
use Database\Seeders\SettingsSeeder;
use Database\Seeders\IndicatorSeeder;
use Database\Seeders\Task\TaskSeeder;
use Database\Seeders\Admin\RoleSeeder;
use Database\Seeders\Admin\UserSeeder;
use Database\Seeders\AttendanceSeeder;
use Database\Seeders\DepartmentSeeder;
use Database\Seeders\DesignationSeeder;
use Database\Seeders\Hrm\HolidaySeeder;
use Database\Seeders\Hrm\MeetingSeeder;
use Database\Seeders\Hrm\PaymentSeeder;
use Database\Seeders\LeaveSttingSeeder;
use Database\Seeders\TestimonialSeeder;
use Database\Seeders\Admin\StatusSeeder;
use Database\Seeders\DutyScheduleSeeder;
use Database\Seeders\NotificationSeeder;
use Database\Seeders\WeekendSetupSeeder;
use Database\Seeders\Admin\CompanySeeder;
use Database\Seeders\CompanyConfigSeeder;
use Database\Seeders\Travel\TravelSeeder;
use Database\Seeders\Hrm\Visit\NoteSeeder;
use Database\Seeders\Hrm\AppointmentSeeder;
use Database\Seeders\Hrm\Shift\ShiftSeeder;
use Database\Seeders\Hrm\Visit\VisitSeeder;
use Database\Seeders\Admin\PermissionSeeder;
use Database\Seeders\AllContentsTableSeeder;
use Database\Seeders\Hrm\LeaveSettingSeeder;
use Database\Seeders\NotificationTypeSeeder;
use Database\Seeders\Hrm\EmployeeTasksSeeder;
use Database\Seeders\LocationLogsTableSeeder;
use Database\Seeders\Management\ClientSeeder;
use Database\Seeders\UserDocumentRequestSeed;
use Database\Seeders\Admin\SubscriptionSeeder;
use Database\Seeders\Hrm\Visit\ScheduleSeeder;
use Database\Seeders\Management\ProjectSeeder;
use Database\Seeders\Hrm\Country\CountrySeeder;
use Database\Seeders\Traits\ApplicationKeyGenerate;
use Database\Seeders\Hrm\AppSetting\AppScreenSeeder;
use Database\Seeders\Hospital\HospitalDatabaseSeeder;

class RegularSeeder extends Seeder
{
    use ApplicationKeyGenerate;

    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        // $this->keyGenerate();
        // ---------------------------------- global --------------------------------
        $this->call(CountrySeeder::class);
        $this->call(StatusSeeder::class);
        $this->call(CompanySeeder::class);
        $this->call(BranchSeeder::class);
        $this->call(ShiftSeeder::class);
        $this->call(RoleSeeder::class);
        $this->call(PermissionSeeder::class);

        // ------------------------------- institute based --------------------------------
        if (env('APP_INSTITUTION') === "hospital") {
            $this->call(HospitalDatabaseSeeder::class);
        } else {
            $this->call(DepartmentSeeder::class);
            $this->call(DesignationSeeder::class);
            $this->call(UserSeeder::class);
        }


        $this->call(SettingsSeeder::class);
        $this->call(UploadSeeder::class);
        $this->call(CompanyConfigSeeder::class);
        $this->call(SubscriptionSeeder::class);
        $this->call(DutyScheduleSeeder::class);
        $this->call(WeekendSetupSeeder::class);
        $this->call(AllContentsTableSeeder::class);
        $this->call(AppScreenSeeder::class);

        $this->call(HolidaySeeder::class);
        // $this->call(ExpenseSeeder::class);

        $this->call(PaymentSeeder::class);
        $this->call(FeatureSeeder::class);
        $this->call(TestimonialSeeder::class);
        $this->call(PayrollSeeder::class);
        $this->call(TeamSeeder::class);
        $this->call(NotificationTypeSeeder::class);

        // Demo Data Start
        // $this->call(VisitSeeder::class);
        // $this->call(NoteSeeder::class);
        // $this->call(ScheduleSeeder::class);
        // $this->call(NoticeSeeder::class);
        // $this->call(EmployeeTasksSeeder::class);
        // $this->call(AppointmentSeeder::class);
        // $this->call(MeetingSeeder::class);
        // $this->call(NotificationSeeder::class);
        // $this->call(AttendanceSeeder::class);
        // $this->call(ExpenseSeeder::class);
        // $this->call(LocationLogsTableSeeder::class);

        // $this->call(GoalSeeder::class);
        // $this->call(IndicatorSeeder::class);
        // $this->call(ClientSeeder::class);
        // $this->call(ProjectSeeder::class);
        // $this->call(TaskSeeder::class);
        // $this->call(AwardSeeder::class);
        // $this->call(TravelSeeder::class);

        // $this->call(UserDocumentRequestSeed::class);

        // $this->call(ModuleSeeder::class);
    }
}
