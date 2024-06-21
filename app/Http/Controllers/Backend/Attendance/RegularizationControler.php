<?php

namespace App\Http\Controllers\Backend\Attendance;

use App\Http\Controllers\Controller;
use App\Models\Hrm\Attendance\Attendance;
use App\Repositories\Hrm\Attendance\AttendanceRegularizationRepository;
use App\Repositories\Hrm\Attendance\AttendanceRepository;
use App\Repositories\Hrm\Department\DepartmentRepository;
use App\Repositories\UserRepository;
use App\Services\Hrm\EmployeeBreakService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class RegularizationControler extends Controller
{
    protected $attendance_repo;
    protected $departmentRepository;
    protected $userRepository;
    protected $breakBackService;
    protected $attendance_reg_repo;

    public function __construct(AttendanceRegularizationRepository $attendance_reg_repo, AttendanceRepository $attendance_repo, DepartmentRepository $departmentRepository, UserRepository $userRepository, EmployeeBreakService $breakBackService)
    {
        $this->attendance_repo = $attendance_repo;
        $this->departmentRepository = $departmentRepository;
        $this->userRepository = $userRepository;
        $this->breakBackService = $breakBackService;
        $this->breakBackService = $breakBackService;
        $this->attendance_reg_repo = $attendance_reg_repo;
    }

    public function checkAttendance(Request $request)
    {
        $date = $request->date;
        $user_id = auth()->user()->id;

        $attendance_data = Attendance::where('user_id', $user_id)->where('date', $date)->first();
        if ($attendance_data && $attendance_data->check_in != null  && $attendance_data->check_out != null) {
            Log::info($attendance_data);
            return response()->json([
                'message' => "Already Checkedin"
            ]);
        } elseif ($attendance_data && $attendance_data->check_in != null && $attendance_data == null) {
            Log::info($attendance_data ? $attendance_data->check_in : null);

            return response()->json([
                'check_in' => $attendance_data ? $attendance_data->check_in : null
            ]);
        } else {
            Log::info($attendance_data);

            return response()->json([
                'check_in' => null
            ]);
        }
    }
    public function dashboardAjaxRegularizationModal(Request $request)
    {
        try {
            $data['title']    = _trans('common.Check In');
            $data['url']      = route('admin.ajaxRegularization');
            $data['check_attendance_url']      = route('admin.checkAttendance');
            $data['button']   = _trans('common.Check In');
            $data['type']     = 'checkin';
            $data['reason']   = $this->attendance_repo->checkInStatus(auth()->user()->id, date('H:i'));
            return view('backend.attendance.attendance.attendance_regularization', compact('data'));
        } catch (\Throwable $th) {
            return response()->json('fail');
        }
    }

    public function dashboardAjaxRegularization(Request $request)
    {
        try {
            $request['user_id'] = auth()->user()->id;
            $request['check_in'] = date('H:i', strtotime($request->checkIn));
            $request['check_out'] = date('H:i', strtotime($request->checkOut));
            $request['date'] = date('Y-m-d', strtotime($request->date));
            $request['check_in_latitude'] = $request->latitude;
            $request['check_in_longitude'] = $request->longitude;
            // $request['remote_mode_in'] = 0;
            if (!$request->has('remote_mode_in')) {
                return $this->responseWithError(_trans('messages.Remote mode is not selected'));
            }
            $request['company_id'] = $this->userRepository->getById($request->user_id)->company->id;

            $store = $this->attendance_reg_repo->store($request);

            if ($store->original['result']) {
                if ($request->check_out) {
                    $request['remote_mode_out'] = 0;
                    $this->attendance_repo->update($request, $store->original['data']->id);
                }
                return $this->responseWithSuccess($store->original['message'], route('admin.dashboard'), 200);
            } else {
                return $this->responseWithError($store->original['message']);
            }
        } catch (\Throwable $th) {
            // return $this->responseWithError($th->getMessage());
        }
    }
}
