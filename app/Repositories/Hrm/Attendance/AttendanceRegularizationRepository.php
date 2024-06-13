<?php

namespace App\Repositories\Hrm\Attendance;

use Carbon\Carbon;
use App\Models\User;
use App\Enums\AttendanceStatus;
use App\Models\Track\LocationLog;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use App\Models\Settings\LocationBind;
use App\Models\coreApp\Setting\IpSetup;
use App\Models\Hrm\Attendance\Attendance;
use App\Helpers\CoreApp\Traits\DateHandler;
use App\Models\Hrm\Attendance\DutySchedule;
use App\Models\coreApp\Setting\CompanyConfig;
use App\Models\Hrm\Attendance\LateInOutReason;
use App\Helpers\CoreApp\Traits\GeoLocationTrait;
use App\Helpers\CoreApp\Traits\TimeDurationTrait;
use App\Helpers\CoreApp\Traits\ApiReturnFormatTrait;
use App\Helpers\CoreApp\Traits\FileHandler;
use App\Models\coreApp\Relationship\RelationshipTrait;
use App\Models\Hrm\Attendance\Regularization;
use App\Repositories\Hrm\Leave\LeaveRequestRepository;
use App\Repositories\Settings\CompanyConfigRepository;
use Illuminate\Support\Facades\Validator;
use JasonGuru\LaravelMakeRepository\Repository\BaseRepository;
//use Your Model

/**
 * Class AttendanceRegularizationRepository.
 */
class AttendanceRegularizationRepository{

    use ApiReturnFormatTrait, RelationshipTrait, TimeDurationTrait, GeoLocationTrait, DateHandler, FileHandler;

    protected $attendance;
    protected $user;
    protected $leave_request_repo;
    protected $config_repo;
    protected $attendance_repo;
    /**
     * @return string
     *  Return the model
     */

     public function __construct(
        Attendance $attendance, 
        Regularization $regularization,
        User $user,
        LeaveRequestRepository $leave_request_repo,
        CompanyConfigRepository $companyConfigRepo,
        AttendanceRepository $attendance_repo
    ) {
        $this->attendance = $attendance;
        $this->user = $user;
        $this->leave_request_repo = $leave_request_repo;
        $this->config_repo = $companyConfigRepo;
        $this->attendance_repo = $attendance_repo;
    }

    public function store($request){
        $validator = Validator::make($request->all(), [
            'check_in' => 'required',
            'check_out' => 'required',
            'date' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->responseWithError(__('Validation field required'), $validator->errors(), 422);
        }

        try {
            // if (auth()->user()->role->slug == 'staff' && $request->user_id != auth()->id()) {
            //     return $this->responseWithError('You are doing a shit thing so go away from here!!', [], 400);
            // }


            $user = $this->user->query()->find(Auth::id());
            Log::info('jyoti-regularization repository->store');
            return $this->attendanceRegularization($user, $request);
        } catch (\Throwable $th) {
            // Log::error($th);
            return $this->responseWithError(_trans('response.Something went wrong.'), [$th->getMessage()], 400);
        }
    }

    public function attendanceRegularization($user, $request){
        Log::info('jyoti-regularization repository->attendanceRegularization');
                    // Log::info($user);
        if($user){
            $attendance = $this->attendance->where(['user_id' => $user->id, 'date' => $request->date])->first();
            if ($attendance && !settings('multi_checkin')) {
                return $this->responseWithError('Attendance already exists', [], 400);
            }
            if (settings('location_check') && !$this->attendance_repo->locationCheck($request)) {
                return $this->responseWithError('Your location is not valid', [], 400);
            }
            $isIpRestricted = $this->attendance_repo->isIpRestricted();
            if($isIpRestricted){
                $request['checkin_ip'] = getUserIpAddr();
                $attendance_status = $this->attendance_repo->checkInStatus($user->id, $request->check_in);
                // Log::info($attendance_status);

                // if (count($attendance_status) > 0) {
                //     if ($attendance_status[0] == AttendanceStatus::LATE && $request['check_in_location'] != 'Device') {
                //         $validator = Validator::make($request->all(), [
                //             'reason' => 'required',
                //         ]); 

                //         if ($validator->fails()) {
                //             $data = [
                //                 'reason_status' => 'L'
                //             ];
                //             return $this->responseWithError(__('Reason is required'), $data, 400);
                //         }
                //     }

                //     }
                    $current_date_time = date('Y-m-d H:i:s');
                    $checkinTime = $this->getDateTime($request->check_in);
                    $regularization = new $this->attendance_repo;
                    Log::info("coming into isIpRstricted");
                    Log::info($regularization);
                    // $regularization->company_id = $user->company->id;
                    // $regularization->user_id = $user->id;
                    // $regularization->remote_mode_in = $request->remote_mode_in;
                    // $regularization->date = $request->date;
            }   
        }
    }
}
