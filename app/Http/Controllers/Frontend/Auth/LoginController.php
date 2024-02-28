<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Models\Role\Role;
use App\Models\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function test()
    {
        return redirect()->route('adminLogin');
    }
    public function getDemoLoginData()
    {
        $users = [];
        try {
            if (config('app.style') === 'demo' || env('APP_STYLE') === "demo") {
                $roles = Role::where('company_id', 1)->get(); // Assuming you have a Role model

                foreach ($roles as $role) {
                    $user = User::join('roles', 'users.role_id', '=', 'roles.id')
                        ->where('users.company_id', 1)
                        ->where('roles.id', $role->id)
                        ->select('users.email', 'roles.name', 'users.company_id')
                        ->first();

                    if ($user) {
                        $users[] = $user;
                    }
                }
            }

            return $users;
        } catch (\Throwable $th) { 
            return $users;
        }
    }

    public function adminLogin()
    {

        $users = [];
        try {
            if (Auth::check()) {
                return redirect('dashboard');
            }
            $users = $this->getDemoLoginData();

            return view('backend.auth.admin_login', compact('users'));
        } catch (\Throwable $th) {
            Toastr::error(_trans('response.Something went wrong'), 'Error');
            abort(500);
        }
    }

    public function LoginForm()
    {
        return view('backend.auth.admin_login');
    }
}
