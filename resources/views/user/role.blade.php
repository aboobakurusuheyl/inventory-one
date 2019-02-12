@extends('include.master')


@section('title','Belontory | Role')


@section('page-title','Role')


@section('content')


        <div class="row clearfix">
        	
        	<create-role></create-role>

        </div>


        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                        <!--     <h2>
                                Vendor List
                          
                            </h2> -->
                          
                          <h2>
                          	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#create-category">
                                <i class="glyphicon glyphicon-plus"></i> Create Role
                             </button>
                          </h2>
                        </div>

                        <view-role></view-role>

                    </div>
                </div>
            </div>

          


@endsection

@push('script')

<script type="text/javascript" src="{{ url('public/js/role.js') }}"></script>

@endpush