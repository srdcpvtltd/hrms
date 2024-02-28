@extends('backend.layouts.app')
@section('title', @$data['title'])
@section('content')
    {!! breadcrumb([
        'title' => @$data['title'],
        route('admin.dashboard') => _trans('common.Dashboard'),
        '#' => @$data['title'],
    ]) !!}
    <div class="table-content table-basic ">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="mt-20">
                            <form action="{{ route('holidaySetup.update', $data['holiday']->id) }}"
                                enctype="multipart/form-data" method="post" id="holidayEditModal">
                                @csrf
                                @method('PATCH')
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="title" class="form-label">{{ _trans('common.Title') }} <span
                                                    class="text-danger">*</span></label>
                                            <input type="text" name="title" id="title"
                                                class="form-control ot-form-control ot-input"
                                                value="{{ $data['holiday']->title }}"
                                                placeholder="{{ _trans('common.Title') }}" required>
                                            @if ($errors->has('title'))
                                                <div class="error">{{ $errors->first('title') }}</div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group mb-3">
                                            <label for="start_date" class="form-label">{{ _trans('common.Start Date') }}
                                                <span class="text-danger">*</span></label>
                                            <input type="date" name="start_date" id="start_date"
                                                value="{{ $data['holiday']->start_date }}"
                                                class="form-control ot-form-control ot-input"
                                                placeholder="{{ _trans('common.Start Date') }}" required>
                                            @if ($errors->has('start_date'))
                                                <div class="error">{{ $errors->first('start_date') }}</div>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-3">
                                            <label for="end_date" class="form-label">{{ _trans('common.End Date') }} <span
                                                    class="text-danger">*</span></label>
                                            <input type="date" name="end_date" id="end_date"
                                                class="form-control ot-form-control ot-input"
                                                value="{{ $data['holiday']->end_date }}"
                                                placeholder="{{ _trans('common.End Date') }}" required>
                                            @if ($errors->has('end_date'))
                                                <div class="error">{{ $errors->first('end_date') }}</div>
                                            @endif

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label class="form-label" for="description"
                                                class="form-label">{{ _trans('common.Description') }} <span
                                                    class="text-danger">*</span></label>
                                            <textarea name="description" id="description" class="form-control ot-input mt-0" cols="30" rows="5"
                                                placeholder="{{ _trans('common.Description') }}" required>{!! $data['holiday']->description !!}</textarea>
                                            @if ($errors->has('description'))
                                                <div class="error">{{ $errors->first('description') }}</div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="form-label" for="status">{{ _trans('common.Attachment') }}</label>
                                            <div class="ot_fileUploader left-side mb-3">
                                                <input class="form-control" type="text" placeholder="{{ _trans('common.Attachment') }}" name="" readonly="" id="placeholder">
                                                <button class="primary-btn-small-input" type="button">
                                                    <label class="btn btn-lg ot-btn-primary" for="fileBrouse">{{ _trans('common.Browse') }}</label>
                                                    <input type="file" class="d-none form-control" name="file" id="fileBrouse">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
              
                                    <div class="col-lg-6">

                                        {{-- status --}}
                                        <div class="form-group">
                                            <label class="form-label" for="status">{{ _trans('common.Status') }} <span
                                                    class="text-danger">*</span></label>
                                            <select name="status_id" class="form-control select2" required="required">
                                                <option value="" disabled selected>{{ _trans('common.Choose One') }}
                                                </option>
                                                <option value="1"
                                                    {{ $data['holiday']->status_id == 1 ? 'selected' : '' }}>
                                                    {{ _trans('common.Active') }}
                                                </option>
                                                <option value="2"
                                                    {{ $data['holiday']->status_id == 2 ? 'selected' : '' }}>
                                                    {{ _trans('common.In-active') }}
                                                </option>
                                            </select>
                                            @if ($errors->has('status_id'))
                                                <div class="error">{{ $errors->first('status_id') }}</div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row  mt-20">
                                    <div class="col-md-12">
                                        <div class="d-flex justify-content-end">
                                            <button class="btn btn-gradian">{{ _trans('common.Update') }}</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('script')
    @include('backend.partials.datatable')

@endsection
