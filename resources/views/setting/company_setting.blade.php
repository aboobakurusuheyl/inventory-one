@extends('include.master')


@section('title','Belontory | Setting')


@section('page-title','Setting')


@section('content')




<div class="row clearfix">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="card">
			<div class="header">
				<h2>
					
					Update Company Information
					
				</h2>
			</div>


			<div class="body">

				
				@if ($errors->any())
				<div class="alert alert-danger">
					<ul>
						@foreach ($errors->all() as $error)
						<li>{{ $error }}</li>
						@endforeach
					</ul>
				</div>
                @endif
                
                @if(Session::has('message'))
                 <p class="alert alert-info">{{ Session::get('message') }}</p>
                @endif
				
                <form action="{{ route('company.store') }}" method="post">
                    
                    {{ csrf_field() }}
					
					<div class="row">
						<div class="col-md-6">
                            <p>Company Name</p>
                            <div class="input-group">
                               
                                <span class="input-group-addon">
                                    <i class="material-icons">palette</i>
                                </span>
                                <div class="form-line">
                                    <input type="text" value="{{ $company->name }}" class="form-control" name="name" placeholder="Company Name">
                                </div>
                            </div>
                        </div>

						<div class="col-md-6">
                                <p>Company Address</p>
                            <div class="input-group">
                                
                                <span class="input-group-addon">
                                    <i class="material-icons">palette</i>
                                </span>
                                <div class="form-line">
                                    <input type="text" value="{{ $company->address }}" class="form-control" name="address" placeholder="Company Address">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                                <p>Company Phone</p>
                            <div class="input-group">
                               
                                <span class="input-group-addon">
                                    <i class="material-icons">palette</i>
                                </span>
                                <div class="form-line">
                                    <input type="text" value="{{ $company->phone }}" class="form-control" name="phone" placeholder="Company Phone">
                                </div>
                            </div>
                        </div>
					</div>


					<div class="row text-center">
						<button type="submit" class="btn bg-teal">Update</button>
					</div>


				</form>

			</div>


		</div>
	</div>
</div>




@endsection