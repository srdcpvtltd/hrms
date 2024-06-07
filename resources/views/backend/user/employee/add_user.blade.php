@extends('backend.layouts.app')
@section('title', @$data['title'])
@section('content')
    {!! breadcrumb([
        'title' => @$data['title'],
        route('admin.dashboard') => _trans('common.Dashboard'),
        '#' => @$data['title'],
    ]) !!}

    <div class="card ot-card">
        <div class="card-body">
            <form method="POST" action="{{ route('user.store') }}" enctype="multipart/form-data">
                @csrf
                <div id="step1" class="form-step">
                    <h3>Step 1</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="name" class="form-label">{{ _trans('common.Name') }} <span
                                        class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control ot-form-control ot-input"
                                    placeholder="{{ _trans('common.Name') }}" value="{{ old('name') }}">
                                @if ($errors->has('name'))
                                    <span class="error text-danger">
                                        {{ $errors->first('name') }}
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="email" class="form-label">{{ _trans('common.Email') }} <span
                                        class="text-danger">*</span></label>
                                <input type="email" name="email" placeholder="{{ _trans('common.Email') }}"
                                    autocomplete="off" class="form-control ot-form-control ot-input"
                                    value="{{ old('email') }}">                
                                @if ($errors->has('email'))
                                    <span class="error text-danger">
                                        {{ $errors->first('email') }}
                                    </span>
                                @endif
                            </div>
                        </div>  
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="phone" class="form-label">{{ _trans('common.Phone') }} <span
                                        class="text-danger">*</span></label>
                                <input type="number" name="phone" placeholder="{{ _trans('common.Phone') }}"
                                    autocomplete="off" class="form-control ot-form-control ot-input"
                                    value="{{ old('phone') }}">
                                @if ($errors->has('phone'))
                                    <div class="error text-danger">{{ $errors->first('phone') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="gender">{{ _trans('common.Gender') }} <span
                                        class="text-danger">*</span></label>
                                <select name="gender"
                                    class="form-select demo-select2-placeholder {{ $errors->has('gender') ? 'is-invalid' : '' }} select2">
                                    <option disabled selected>{{ _trans('common.Choose One') }}</option>
                                    <option value="0" {{ old('gender') == 0 ? 'selected' : '' }}>
                                        {{ _trans('common.Male') }}</option>
                                    <option value="1" {{ old('gender') == 1 ? 'selected' : '' }}>
                                        {{ _trans('common.Female') }}</option>
                                    <option value="2" {{ old('gender') == 2 ? 'selected' : '' }}>
                                        {{ _trans('common.Unisex') }}</option>
                                </select>
                                @if ($errors->has('gender'))
                                    <span class="error text-danger">
                                        {{ $errors->first('gender') }}
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6 ">
                            <div class="form-group mb-3">
                                <label class="form-label  mt-3"
                                    for="speak_language">{{ _trans('common.Speak Language') }}</label>
                                <input type="text" name="speak_language" value="" class="form-control ot-form-control ot-input">
                                @if ($errors->has('speak_language'))
                                    <div class="error text-danger">{{ $errors->first('speak_language') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label"
                                    for="marital_status">{{ _trans('common.Marital Status') }}</label>
                                <select name="marital_status" id="marital_status" class="form-select select2">
                                    <option disabled selected>{{ _trans('common.Choose One') }}
                                    </option>
                                    <option value="Married" {{ old('marital_status') == 'Married' ? 'selected' : '' }}>
                                        {{ _trans('common.Married') }}</option>
                                    <option value="Unmarried"
                                        {{ old('marital_status') == 'Unmarried' ? 'selected' : '' }}>
                                        {{ _trans('common.Unmarried') }}</option>
                                </select>
                                @if ($errors->has('marital_status'))
                                    <div class="error text-danger">{{ $errors->first('marital_status') }}</div>
                                @endif
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="password"
                                    class="form-label">{{ _trans('common.Password') }} <span class="text-danger">*</span>
                                </label> <br>
                                <input type="radio" name="password_type" value="default" id="" checked> <span class="mr-4">{{ _trans('common.Default Password') }} (12345678)</span>
                                <input type="radio" name="password_type" value="custom" id=""> <span>{{ _trans('common.Custom Password') }}</span>
                            </div>
                        </div>

                        <div id="SelectionDiv" class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="password"
                                    class="form-label">{{ _trans('common.Password') }} <span class="text-danger">*</span>
                                    <span data-toggle="tooltip" data-placement="top"
                                        title="Leave the field blank to use the default password '12345678'"><i
                                            class="fa-solid fa-circle-info"></i></span></label>
                                <input type="text" name="password" placeholder="{{ _trans('common.Password') }}"
                                    autocomplete="off" class="form-control ot-form-control ot-input"
                                    value="{{ old('password') }}" id="password">
                                @if ($errors->has('password'))
                                    <div class="error text-danger">{{ $errors->first('password') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="gender">{{ _trans('common.Religion') }}</label>

                                <select name="religion" id="religion" class="form-select select2">
                                    <option disabled selected>{{ _trans('common.Choose One') }}
                                    </option>
                                    <option value="Islam" {{ old('religion') == 'Islam' ? 'selected' : '' }}>
                                        {{ _trans('common.Islam') }}
                                    </option>
                                    <option value="Hinduism" {{ old('religion') == 'Hinduism' ? 'selected' : '' }}>
                                        {{ _trans('common.Hinduism') }}
                                    </option>
                                    <option value="Christianity" {{ old('religion') == 'Christianity' ? 'selected' : '' }}>
                                        {{ _trans('common.Christianity') }}
                                    </option>
                                    <option value="Buddhism" {{ old('religion') == 'Buddhism' ? 'selected' : '' }}>
                                        {{ _trans('common.Buddhism') }}
                                    </option>
                                    <option value="Others" {{ old('religion') == 'Others' ? 'selected' : '' }}>
                                        {{ _trans('common.Others') }}
                                    </option>
                                </select>
                                @if ($errors->has('religion'))
                                    <div class="error text-danger">{{ $errors->first('religion') }}</div>
                                @endif
                            </div>
                        </div>
                        
                        
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="button" class="btn btn-primary" onclick="nextStep(2)">Next</button>
                    </div>
                </div>

                <div id="step2" class="form-step d-none">
                    <h3>Step 2</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="joining_date" class="form-label">{{ _trans('common.Joining Date') }} <span
                                        class="text-danger">*</span></label>
                                <input type="date" name="joining_date" autocomplete="off"
                                    class="form-control ot-form-control ot-input" value="{{ old('joining_date') }}">
                                @if ($errors->has('joining_date'))
                                    <div class="error text-danger">{{ $errors->first('joining_date') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="birth_date" class="form-label">{{ _trans('common.Date Of Birth') }}</label>
                                <input type="date" name="birth_date" autocomplete="off"
                                    class="form-control ot-form-control ot-input" value="{{ old('birth_date') }}">
                                @if ($errors->has('birth_date'))
                                    <div class="error text-danger">{{ $errors->first('birth_date') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="basic_salary" class="form-label">{{ _trans('common.Gross Salary') }} <span
                                        class="text-danger">*</span></label>
                                <input type="number" name="basic_salary" placeholder="{{ _trans('common.Salary') }}"
                                    autocomplete="off" class="form-control ot-form-control ot-input" step="0.01"
                                    value="{{ old('basic_salary') }}">
                                @if ($errors->has('basic_salary'))
                                    <div class="error text-danger">{{ $errors->first('basic_salary') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="country" class="form-label">{{ _trans('common.Country') }} <span
                                        class="text-danger">*</span>
                                </label>
                                <select name="country" class="form-control ot-form-control ot-input select2"
                                    id="_country_id">
                                    @foreach ($data["countries"] as $country)
                                        <option value="{{ $country->id }}"
                                            {{ $country->name === 'Bangladesh' ? 'selected' : '' }}>
                                            {{ $country->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @if ($errors->has('country'))
                                    <div class="error text-danger">{{ $errors->first('country') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="blood_group">{{ _trans('common.Blood Group') }}</label>
                                <select name="blood_group" class="form-select select2">
                                    <option disabled selected>{{ _trans('common.Choose One') }}</option>
                                    <option value="A+" {{ old('blood_group') == 'A+' ? 'selected' : '' }}>
                                        {{ _trans('common.A+') }}</option>
                                    <option value="A-" {{ old('blood_group') == 'A-' ? 'selected' : '' }}>
                                        {{ _trans('common.A-') }}</option>
                                    <option value="B+" {{ old('blood_group') == 'B+' ? 'selected' : '' }}>
                                        {{ _trans('common.B+') }}</option>
                                    <option value="B-" {{ old('blood_group') == 'B-' ? 'selected' : '' }}>
                                        {{ _trans('common.B-') }}</option>
                                    <option value="O+" {{ old('blood_group') == 'O+' ? 'selected' : '' }}>
                                        {{ _trans('common.O+') }}</option>
                                    <option value="O-" {{ old('blood_group') == 'O-' ? 'selected' : '' }}>
                                        {{ _trans('common.O-') }}</option>
                                    <option value="AB+" {{ old('blood_group') == 'AB+' ? 'selected' : '' }}>
                                        {{ _trans('common.AB+') }}</option>
                                    <option value="AB-" {{ old('blood_group') == 'AB-' ? 'selected' : '' }}>
                                        {{ _trans('common.AB-') }}</option>
                                </select>
                                @if ($errors->has('blood_group'))
                                    <div class="error text-danger">{{ $errors->first('blood_group') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6 ">
                            <div class="form-group mb-3">
                                <label class="form-label  mt-3"
                                    for="employee_id">{{ _trans('common.Employee ID') }}</label>
                                <input type="text" name="employee_id" value="" class="form-control ot-form-control ot-input">
                                @if ($errors->has('employee_id'))
                                    <div class="error text-danger">{{ $errors->first('employee_id') }}</div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="name">{{ _trans('common.Address') }}</label>
                                <input type="text" name="address" placeholder={{ _trans('common.Address') }}
                                    autocomplete="off" class="form-control ot-form-control ot-input"
                                    value="{{ old('address') }}">
                                @if ($errors->has('address'))
                                    <div class="error text-danger">{{ $errors->first('address') }}</div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary" onclick="prevStep(1)">Previous</button>
                        <button type="button" class="btn btn-primary" onclick="nextStep(3)">Next</button>
                    </div>
                </div>

                <div id="step3" class="form-step d-none">
                    <h3>Step 3</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="department_id">{{ _trans('common.Department') }} <span
                                        class="text-danger">*</span></label>
                                <select name="department_id"
                                    class="form-select select2 {{ $errors->has('department_id') ? 'is-invalid' : '' }}">
                                    <option value="" disabled selected>{{ _trans('common.Choose One') }}
                                    </option>
                                    @foreach ($data['departments'] as $department)
                                        <option value="{{ $department->id }}"
                                            {{ old('department_id') == $department->id ? 'selected' : '' }}>
                                            {{ $department->title }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('department_id'))
                                    <span class="error text-danger">
                                        {{ $errors->first('department_id') }}
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="designation_id">{{ _trans('common.Designation') }} <span
                                        class="text-danger">*</span></label>
                                <select name="designation_id"
                                    class="form-select select2 {{ $errors->has('designation_id') ? 'is-invalid' : '' }}">
                                    <option value="" disabled selected>{{ _trans('common.Choose One') }}
                                    </option>
                                    @foreach ($data['designations'] as $designation)
                                        <option value="{{ $designation->id }}"
                                            {{ old('designation_id') == $designation->id ? 'selected' : '' }}>
                                            {{ $designation->title }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('designation_id'))
                                    <span class="error text-danger">
                                        {{ $errors->first('designation_id') }}
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="shift_id">{{ _trans('common.Shift') }} <span
                                        class="text-danger">*</span></label>
                                <select name="shift_id"
                                    class="form-select select2 {{ $errors->has('shift_id') ? 'is-invalid' : '' }}">
                                    <option value="" disabled selected>{{ _trans('common.Choose One') }}
                                    </option>
                                    @foreach ($data['shifts'] as $shift)
                                        <option value="{{ $shift->id }}"
                                            {{ old('shift_id') == $shift->id ? 'selected' : '' }}>
                                            {{ $shift->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('shift_id'))
                                    <span class="error text-danger">
                                        {{ $errors->first('shift_id') }}
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label" for="role_id">{{ _trans('common.Role') }} <span
                                        class="text-danger">*</span></label>
                                <select name="role_id"
                                    class="form-select select2 {{ $errors->has('role_id') ? 'is-invalid' : '' }}">
                                    <option value="" disabled selected>{{ _trans('common.Choose One') }}
                                    </option>
                                    @foreach ($data['roles'] as $role)
                                        <option value="{{ $role->id }}"
                                            {{ old('role_id') == $role->id ? 'selected' : '' }}>
                                            {{ $role->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('role_id'))
                                    <span class="error text-danger">
                                        {{ $errors->first('role_id') }}
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="image" class="form-label">{{ _trans('common.Avatar') }}</label>
                                <input type="file" name="image" class="form-control ot-form-control ot-input"
                                    value="{{ old('image') }}">
                                @if ($errors->has('image'))
                                    <div class="error text-danger">{{ $errors->first('image') }}</div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary" onclick="prevStep(2)">Previous</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

      <script>
        function nextStep(step) {
            document.querySelectorAll('.form-step').forEach(step => step.classList.add('d-none'));
            document.getElementById(`step${step}`).classList.remove('d-none');
        }

        function prevStep(step) {
            document.querySelectorAll('.form-step').forEach(step => step.classList.add('d-none'));
            document.getElementById(`step${step}`).classList.remove('d-none');
        }
    </script>
@endsection

@section('script')
    <script src="{{ url('backend/js/pages/__profile.js') }}"></script>

        <script>
    $(document).ready(function() {
        // Initially hide the role selection div
        $('#SelectionDiv').hide();

        // Attach an event listener to the radio buttons
        $('input[name="password_type"]').on('change', function() {
            if ($(this).val() === 'custom') {
            
                // If the 'custom' radio button is selected, show the role selection div
                $('#SelectionDiv').show();
            } else {
                // If the 'default' radio button is selected or other value, hide the  selection div
                $('#SelectionDiv').hide();
            }
        });
    });

    </script>

@endsection
