<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DesignationSeeder extends Seeder
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

        if (env('APP_INSTITUTION') === "hospital") {
            $designations = [
                'Chairman',
                'Managing Director',
                'HR Manager',
                'IT Manager',
                'Doctor',
                'Nurse',
                'Surgeon',
                'Pharmacist',
                'Radiologist',
                'Laboratory Technician',
                'Administrator',
                'Paramedic',
                'Physiotherapist',
                'Occupational Therapist',
                'Dietitian',
                'Medical Technologist',
                'Anesthesiologist',
                'Psychiatrist',
                'Social Worker'
            ];
        } else if (env('APP_INSTITUTION') === "bank") {
            $designations = [
                'Chairman',
                'Managing Director',
                'HR Manager',
                'IT Manager',
                'Bank Teller',
                'Branch Manager',
                'Loan Officer',
                'Financial Analyst',
                'Customer Service Representative',
                'Operations Manager',
                'Risk Analyst',
                'Investment Banker',
                'Credit Analyst',
                'Auditor',
                'Financial Advisor',
                'Accountant',
                'Treasury Analyst',
                'Mortgage Consultant',
                'Fraud Investigator',
            ];
        } else {
            $designations = ['Admin', 'HR', 'Staff'];
        }


        // Arrays to store data for bulk insert
        $designationData = [];
        $departmentData = [];

        foreach ($designations as $key => $designation) {
            // Prepare data for designations
            $designationData[] = [
                'title' => $designation,
                'company_id' => $company_id,
                'branch_id' => $branch_id,
                'status_id' => 1,
            ];
        }
        // Bulk insert data into 'designations' and 'departments' tables
        DB::table('designations')->insert($designationData);

        if ($input) {

            // Update input with the last inserted IDs for designations
            $lastDesignationId = DB::table('designations')->pluck('id')->last();

            $input['designation_id'] = $lastDesignationId;

            session()->put('input', $input);
        }
    }
}
