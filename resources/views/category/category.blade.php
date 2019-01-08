@extends('include.master')


@section('title','Belontory | Category')


@section('page-title','Category List')


@section('content')


        <div class="row clearfix">
        	
        	<create-category></create-category>

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
                                <i class="glyphicon glyphicon-plus"></i> Create Category
                             </button>
                          </h2>
                        </div>

                        <view-category></view-category>

                    </div>
                </div>
            </div>

          


@endsection

@push('script')

<script type="text/javascript" src="{{ url('public/js/category.js') }}"></script>

@endpush