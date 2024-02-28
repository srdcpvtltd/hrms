<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DepartmentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $input = session()->get('input');
        $departments = ['Management', 'IT', 'Sales'];

        foreach ($departments as $department) {

            $departmentData[] = [
                'title' => $department,
                'company_id' => 1,
                'branch_id' => 1,
                'status_id' => 1,
            ];
        }

        DB::table('departments')->insert($departmentData);

        
        if ($input) {
            $lastDepartmentId = DB::table('departments')->pluck('id')->last();
            $input['department_id'] = $lastDepartmentId;
            session()->put('input', $input);
        }
    }
}
