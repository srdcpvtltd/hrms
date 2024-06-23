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
    protected $regularization;
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
        AttendanceRepository $attendance_repo,
    ) {
        $this->attendance = $attendance;
        $this->regularization = $regularization;
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
            return $this->attendanceRegularization($user, $request);
        } catch (\Throwable $th) {
            // Log::error($th);
            return $this->responseWithError(_trans('response.Something went wrong.'), [$th->getMessage()], 400);
        }
    }

    public function attendanceRegularization($user, $request){
        Log::info($request);
        Log::info('jyoti-regularization repository->attendanceRegularization');
                    // Log::info($user);
        if($user){
            Log::info($user);
            $attendance = $this->attendance->where(['user_id' => $user->id, 'date' => $request->date])->first();
            $check_regularization = $this->regularization->where(['user_id' => $user->id, 'date' => $request->date])->first();;
            if ($check_regularization && $attendance && !settings('multi_checkin')) {
                Log::info("multi_checkin");
                return $this->responseWithError('Attendance already exists', [], 400);
            }
            if (settings('location_check') && !$this->attendance_repo->locationCheck($request)) {
                Log::info("location_check");
                return $this->responseWithError('Your location is not valid', [], 400);
            }
            $isIpRestricted = $this->attendance_repo->isIpRestricted();  

            if ($isIpRestricted) {
                $request['checkin_ip'] = getUserIpAddr();
                $attendance_status = $this->attendance_repo->checkInStatus($user->id, $request->check_in);
                Log::info($attendance_status);
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
                    
                    $current_date_time = date('Y-m-d H:i:s');
                    $checkinTime = $this->getDateTime($request->checkIn);
                    $checkoutTime = $this->getDateTime($request->checkOut);

                    $regularization = new $this->regularization;
                    // dd($check_in);
                    $regularization->user_id = $user->id;
                    $regularization->company_id = $user->company->id;
                    $regularization->remote_mode_in = $request->remote_mode_in;
                    $regularization->date = $request->date;   

                    if ($request->hasFile('face_image')) {
                        $filePath = $this->uploadImage($request->face_image, 'uploads/attendance/');
                        $regularization->face_image = $filePath ? $filePath->id : null;
                    }

                    if ($request->attendance_from == 'web') {
                        $regularization->check_in = $checkinTime;
                        $regularization->check_out = $checkoutTime;

                    } else {
                        $regularization->check_in = $current_date_time;
                        $regularization->check_out = $checkoutTime;
                    }

                    $regularization->in_status = $attendance_status[0];
                    $regularization->checkin_ip = $request->checkin_ip;
                    $regularization->late_time = $attendance_status[1];
                    // $check_in->check_in_location = $request->check_in_location;
                    $regularization->check_in_location = getGeocodeData($request->latitude, $request->longitude);
                    $regularization->check_in_latitude = $request->latitude;
                    $regularization->check_in_longitude = $request->longitude;
                    $regularization->check_in_city = $request->city;
                    $regularization->check_in_country_code = $request->country_code;
                    $regularization->check_in_country = $request->country;
                    $regularization->save();

                    if ($request->reason) {
                        LateInOutReason::create([
                            'regularization_id' => $regularization->id,
                            'user_id' => $regularization->user_id, 
                            'company_id' => $regularization->user->company->id,
                            'type' => 'in',
                            'reason' => $request->reason
                        ]);
                    }

                    return $this->responseWithSuccess('Check in Regularization Successfull', $regularization, 200);
                // } else {
                //     return $this->responseWithError('No Schedule found', [], 400);
                // }
            } else {
                return $this->responseWithError('You your ip address is not valid', [], 400);
            }
        }
    }
}
