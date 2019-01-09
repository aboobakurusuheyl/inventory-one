@extends('include.master')


@section('title','Belontory | Invoice')


@section('page-title','Invoice')


@section('content')


        <div class="row clearfix">
        	
        	<create-invoice  :categorys="{{ $category }}" :customers="{{ $customer }}"></create-invoice>

        </div>


        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                        <!--     <h2>
                                Vendor List
                          
                            </h2> -->
                          
                 <!--          <h2 >
                          	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#create-stock">
                                <i class="glyphicon glyphicon-plus"></i> New Invoice
                             </button>
                          </h2> -->
                        </div>
<!-- 
                        <view-invoice  :categorys="{{ $category }}" :customers="{{ $customer }}"></view-invoice>
 -->
                    </div>
                </div>
            </div>

          


@endsection

@push('script')

<script type="text/javascript" src="{{ url('public/js/invoice.js') }}"></script>

@endpush