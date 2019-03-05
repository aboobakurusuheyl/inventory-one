<!DOCTYPE html>
<html>
<head>
	<title>belontory-invoice:{{ $invoice->id }}</title>
	<link href="{{ url('plugins/bootstrap/css/bootstrap.css') }}" rel="stylesheet">
</head>
<body>
    <div class="container">
    	<div class="row">
    		<div class="col-md-12" style="text-align: center;">
    		<h2 >{{ $company->name }}</h2>
    		<small>{{ $company->address }}</small><br>
    		<small>{{ $company->phone }}</small>
    		<hr>
    	</div>
    	</div>
    </div>
    <div class="container">
    
      <!-- title row -->
      <div class="row">
<!--         <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> Invoice Details: {{ $invoice->id }}
            <small class="pull-right"> </small>
          </h2>
        </div> -->
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          Customer Info
          <address>
            <strong>{{ $invoice->customer->customer_name }}</strong><br>

            <span style="font-weight: bold">Phone:</span> {{ $invoice->customer->phone }}<br>
            <span style="font-weight: bold">Email:</span> {{ $invoice->customer->email ? $invoice->customer->email : 'no email' }}<br>

            <span style="font-weight: bold">Address:</span> {{ $invoice->customer->address  }}<br>
            
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col text-right">
          <b style="font-weight: bold;color: green">Invoice No: {{ $invoice->id }}</b><br>
          <b>Date:{{ date("d F Y", strtotime($invoice->sell_date)) }}</b><br>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped table-bordered table-condensed">
            <thead style="background-color: teal;color: #fff;">
            <tr>
              <th>Category</th>
              <th>Product</th>
              <th>Chalan</th>
              <th>Quantity</th>
              <th>Unit Price</th>
              <th>Discount</th>
              <th>Total Price</th>
            </tr>
            </thead>
            <tbody>
              @php
               
               $sub_total = 0;
               $discount = 0;
              @endphp
              @foreach($invoice_details as $value)
            <tr>
              <td>{{ $value->stock->category->name }}</td>
              <td>{{ $value->stock->product->product_name }}</td>
              <td>{{ $value->chalan_no }}</td>
              <td>{{ $value->sold_quantity }}</td>
              <td>{{ $value->sold_price }}</td>
              <td>{{ $value->discount_amount }}</td>
              <td>{{ $value->total_sold_price }}</td>
            </tr>
            @php
              $discount += $value->discount_amount; 
              $sub_total += $value->total_sold_price;
            @endphp

            @endforeach
 
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <div class="row">
        <!-- accepted payments column -->
        <div class="col-xs-8">

        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <!-- <p class="lead">Amount Due 2/22/2014</p> -->

          <div class="table-responsive">
            <table class="table">
              <tr>
                <th style="width:50%">Subtotal:</th>
                <td>৳ {{ $sub_total+$discount }}</td>
              </tr>
              <tr>
                <th>Discount:</th>
                <td>৳ {{ $discount }}</td>
              </tr>
              <tr>
                <th>Total Payable:</th>
                <td>৳ {{ $sub_total }}</td>
              </tr> 
              <tr>
                <th>Paid Amount:</th>
                <td>৳ {!! $paid = $invoice->paid_amount !!}</td>
              </tr>  
              <tr>
                <th>Due Amount:</th>
                <td>৳ {{ $sub_total-$paid }}</td>
              </tr>
            </table>
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->




    </div>
    <script >
      window.print();
    </script>
</body>
</html>