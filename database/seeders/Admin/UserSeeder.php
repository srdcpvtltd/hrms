<?php

namespace Database\Seeders\Admin;

use App\Helpers\CoreApp\Traits\PermissionTrait;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{

    use PermissionTrait;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        try {
            foreach($this->userData() ?? [] as $user) {
                User::updateOrCreate([
                    'email'                     => $user['email'],
                ], [
                    'name'                      => $user['name'],
                    'is_admin'                  => @$user['is_admin'],
                    'is_hr'                     => @$user['is_hr'],
                    'role_id'                   => @$user['role_id'],
                    'company_id'                => @$user['company_id'],
                    'country_id'                => @$user['country_id'],
                    'shift_id'                  => @$user['shift_id'],
                    'department_id'             => @$user['department_id'],
                    'designation_id'            => @$user['designation_id'],
                    'phone'                     => @$user['phone'],
                    'permissions'               => @$user['permissions'],
                    'email_verified_at'          => now(),
                    'remember_token'            => Str::random(10),
                    'is_email_verified'          => 'verified',
                    'email_verify_token'        => Str::random(10),
                    'password'                  => Hash::make('12345678'),
                ]);
            }
        } catch (\Throwable $th) {
            Log::error($th);
            echo $th->getMessage();
        }
    }

    protected function userData()
    {
        if (session()->get('input') == '') {
            return array_merge($this->adminUsers(), $this->hrUsers(), $this->staffUsers());
        }

        return $this->subscriptionAdminUser();
    }

    protected function adminUsers()
    {
        $adminUsers = [];

        $adminUsers[] = [
            'name'                      => "Admin",
            'email'                     => 'admin@onesttech.com',
            'is_admin'                  => 1,
            'is_hr'                     => 0,
            'role_id'                   => 2,
            'company_id'                => 1,
            'country_id'                => 223,
            'shift_id'                  => 1,
            'department_id'             => 1,
            'designation_id'            => 1,
            'phone'                     => '0172xxxxxxxx',
            'permissions'               => json_encode($this->adminPermissions()),
        ];

        for ($i = 1; $i <= 5; $i++) {
            $adminUsers[] = [
                'name'                  => "Admin" . $i,
                'email'                 => 'admin' . $i . '@onesttech.com',
                'is_admin'              => 1,
                'is_hr'                 => 0,
                'role_id'               => 2,
                'company_id'            => 1,
                'country_id'            => 223,
                'shift_id'              => 1,
                'department_id'         => 1,
                'designation_id'        => 1,
                'phone'                 => '0172' . $i . 'xxxxxxxx',
                'permissions'           => json_encode($this->adminPermissions()),
            ];
        }

        return $adminUsers;
    }

    protected function subscriptionAdminUser()
    {
        $input  = session()->get('input');
        $name   = $input['name'] ?? 'Admin';
        $email  = $input['email'] ?? 'company' . time() . '@onesttech.com';
        $phone  = $input['phone'] ?? time();

        if ($input) {
            $input['user_id'] = 1;
            session()->put('input', $input);
        }

        $adminUser = [];
        $adminUser[] = [
            'name'                  => $name,
            'email'                 => $email,
            'phone'                 => $phone,
            'is_admin'              => 1,
            'is_hr'                 => 0,
            'role_id'               => 2,
            'company_id'            => 1,
            'country_id'            => 223,
            'shift_id'              => 1,
            'department_id'         => 1,
            'designation_id'        => 1,
            'permissions'           => json_encode($this->adminPermissions()),
        ];

        return $adminUser;
    }

    protected function hrUsers()
    {
        $hrUsers = [];
        
        $hrUsers[] = [
            'name'                      => "HR",
            'email'                     => 'hr@onesttech.com',
            'is_admin'                  => 0,
            'is_hr'                     => 1,
            'role_id'                   => 3,
            'company_id'                => 1,
            'country_id'                => 223,
            'shift_id'                  => 1,
            'department_id'             => 1,
            'designation_id'            => 1,
            'phone'                     => '0171xxxxxxxx',
            'permissions'               => json_encode($this->hrPermissions()),
        ];

        for ($i = 1; $i <= 5; $i++) {
            $hrUsers[] = [
                'name'                  => "HR" . $i,
                'email'                 => 'hr' . $i . '@onesttech.com',
                'is_admin'              => 0,
                'is_hr'                 => 1,
                'role_id'               => 3,
                'company_id'            => 1,
                'country_id'            => 223,
                'shift_id'              => 1,
                'department_id'         => 1,
                'designation_id'        => 1,
                'phone'                 => '0171' . $i . 'xxxxxxxx',
                'permissions'           => json_encode($this->hrPermissions())
            ];
        }

        return $hrUsers;
    }

    protected function staffUsers()
    {
        $staffUsers = [];

        if (env('APP_COMPANY') == "onesttech") {
            $staffs = [
                [
                    'name' => 'Md Rasheduzzaman',
                    'email' => 'rashed@onesttech.com',
                    'phone' => '01810038852',
                ],
                [
                    'name' => 'Mamun Hossain',
                    'email' => 'mamun@onesttech.com',
                    'phone' => '01810038853',
                ],
                [
                    'name' => 'Jubaer Hossain',
                    'email' => 'jubaer@onesttech.com',
                    'phone' => '01810038854',
                ],

                [
                    'name' => 'Bijoy Ghosh',
                    'email' => 'bijoy@onesttech.com',
                    'phone' => '01810038855',
                ],
                [
                    'name' => 'Salah Uddin Mazumder',
                    'email' => 'salah@onesttech.com',
                    'phone' => '01810038856',
                ],
                [
                    'name' => 'Foysal Chowdhury',
                    'email' => 'foysal@onesttech.com',
                    'phone' => '01810038857',
                ],
                [
                    'name' => 'Anindya Mazumder',
                    'email' => 'anindya@onesttech.com',
                    'phone' => '01810038858',
                ],
                [
                    'name' => 'Abrar Sajed Rahman',
                    'email' => 'abrar@onesttech.com',
                    'phone' => '01810038859',
                ],
                [
                    'name' => 'Raihan Howlader',
                    'email' => 'raihan@onesttech.com',
                    'phone' => '01810038860',
                ],
                [
                    'name' => 'Saiful Islam',
                    'email' => 'saiful@onesttech.com',
                    'phone' => '01810038861',
                ],
                [
                    'name' => 'Arafath Hossain',
                    'email' => 'arafat@onesttech.com',
                    'phone' => '01810038862',
                ],
                [
                    'name' => 'Md. Saiful Islam',
                    'email' => 'saifulislam@onesttech.com',
                    'phone' => '01810038863',
                ],
                [
                    'name' => 'Ebrahim Khalil',
                    'email' => 'ebrahim@onesttech.com',
                    'phone' => '01810038864',
                ],
                [
                    'name' => 'Md. Limon Shah',
                    'email' => 'limon@onesttech.com',
                    'phone' => '01810038865',
                ],
                [
                    'name' => 'Robi Ratno Mazumder',
                    'email' => 'robi@onesttech.com',
                    'phone' => '01810038866',
                ],
                [
                    'name' => 'Md. Hannan',
                    'email' => 'hannan@onesttech.com',
                    'phone' => '01810038867',
                ],
                [
                    'name' => 'Md. Hanif Chowdhury',
                    'email' => 'hanif@onesttech.com',
                    'phone' => '01810038868',
                ],
                [
                    'name' => 'Gopal Talukder',
                    'email' => 'gopal@onesttech.com',
                    'phone' => '01810038869',
                ],
                [
                    'name' => 'Imran',
                    'email' => 'imran@onesttech.com',
                    'phone' => '01810038870',
                ],
                [
                    'name' => 'Muaz Bin Zakir',
                    'email' => 'muaz@onesttech.com',
                    'phone' => '01810038871',
                ],
            ];
            foreach ($staffs as $staff) {
                $staffUsers[] = [
                    'name'                  => $staff['name'],
                    'email'                 => $staff['email'],
                    'phone'                 => $staff['phone'],
                    'is_admin'              => 0,
                    'is_hr'                 => 0,
                    'role_id'               => 4,
                    'company_id'            => 1,
                    'country_id'            => 223,
                    'shift_id'              => 1,
                    'department_id'         => 1,
                    'designation_id'        => 1,
                    'permissions'           => json_encode($this->staffPermissions()),
                ];
            }
        } else {
            for ($i = 1; $i < 2; $i++) {
                $staffUsers[] = [
                    'name'                  => 'Staff' . $i,
                    'email'                 => 'staff' . $i . '@onesttech.com',
                    'is_admin'              => 0,
                    'is_hr'                 => 1,
                    'role_id'               => 4,
                    'company_id'            => 1,
                    'country_id'            => 223,
                    'shift_id'              => 1,
                    'department_id'         => 1,
                    'designation_id'        => 1,
                    'phone'                 => '0171xxxxxxx' . $i,
                    'permissions'           => json_encode($this->staffPermissions()),
                ];
            }
        }
        
        return $staffUsers;
    }
}
