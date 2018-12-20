@extends('include.master')


@section('title','Belontory | Vendor')


@section('page-title','Product List')


@section('content')


        <div class="row clearfix">
        	
        	<create-product></create-product>

        </div>


        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                        <!--     <h2>
                                Vendor List
                          
                            </h2> -->
                          
                          <h2 >
                          	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#create-vendor">
                                <i class="glyphicon glyphicon-plus"></i> Create New
                             </button>
                          </h2>
                        </div>

                        <view-product></view-product>

                    </div>
                </div>
            </div>

          


@endsection

@push('script')

<script type="text/javascript" src="{{ url('public/js/product.js') }}"></script>

@endpush