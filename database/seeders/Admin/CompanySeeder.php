<?php

namespace Database\Seeders\Admin;

use App\Models\Company\Company;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Log;

class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $input = session()->get('input');
        $company_id = $input['company_id'] ?? 1;
        $branch_id = $input['branch_id'] ?? 1;
        // Check if session input data is available
        if ($input) {
            try {
                // Create a company using session input data
                $company =  Company::create([
                    'country_id' => $input['country_id'] ?? 1,
                    'name' => $input['name'] ?? 'Company1',
                    'company_name' => $input['company_name'] ?? 'Company1',
                    'email' => $input['email'] ?? 'test12@demo.com',
                    'phone' => $input['phone'] ?? '+8801710077625',
                    'total_employee' => $input['total_employee'] ?? 10,
                    'trade_licence_number' => $input['trade_licence_number'] ?? '1234567890',
                    'business_type' => $input['business_type'] ?? 'test1',
                    'subdomain' => $input['subdomain'] ?? 'test1',
                    'is_main_company' => 'no',
                    'is_subscription' => @$input['is_subscription'] ?? 0,
                ]);
                $input['company_id'] = $company->id;
                session()->put('input', $input);
            } catch (\Throwable $th) {
                Log::error($th);
                echo $th->getMessage();
            }
        } else {
            try {
                Company::create([
                    'country_id' => 223, // United States
                    'name' => 'Admin',
                    'company_name' => 'Company 1',
                    'email' => 'admin@onesttech.com',
                    'phone' => '+8801959335555',
                    'total_employee' => 400,
                    'business_type' => 'Service',
                    'is_main_company' => 'yes',
                ]);

                Company::create([
                    'country_id' => 223, // United States
                    'name' => 'Branch Admin',
                    'company_name' => 'Branch 1',
                    'email' => 'admin2@onesttech.com',
                    'phone' => '+8801959335556',
                    'total_employee' => 400,
                    'business_type' => 'Service',
                    'is_main_company' => 'yes',
                ]);
            } catch (\Throwable $th) {
                Log::error($th);
                echo $th->getMessage();
            }
        }
    }
}
