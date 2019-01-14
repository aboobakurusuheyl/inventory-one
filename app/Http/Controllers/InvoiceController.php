<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Category;
use App\Product;
use App\Stock;
use App\StockDetails;
use App\Vendor;
use App\Customer;
use App\Sell;
use App\SellDetails;
use App\Payment;
use DB;
use Auth;

class InvoiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $category = Category::orderBy('name','asc')->get();
       $customer = Customer::orderBy('customer_name','asc')->get();

       return view('invoice.invoice',[
        'category'=>$category,
        'customer'=>$customer
        ]);
    }


    public function getLastInvoice(){

            
            $invoice = Sell::orderBy('id','desc')->first();

            if(count($invoice)>0){

                return $invoice->id + 1;
            }
            else{

                return 1;
            }

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
          'customer_type' => 'required',
          'customer_id' => 'required_if:customer_type,1',
          'customer_name' => 'required_if:customer_type,2',
          'customer_email' => 'nullable|unique:customers,email',
          'customer_phone' => 'nullable|unique:customers,phone',
          'invoice_date' => 'required',
          'paid_amount' => 'nullable|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',


          'product.*.category' => 'required',
          'product.*.product_id' => 'required',
          'product.*.chalan_id' => 'required',
          'product.*.quantity' => 'required|integer',
          'product.*.price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
          'product.*.total_price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
          'product.*.discount' => 'nullable|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
        ],[
           
          'customer_id.required_if' => 'required',
          'customer_name.required_if' => 'required',

          'product.*.category.required' => 'required field',
          'product.*.product_id.required' => 'required field',
          'product.*.chalan_id.required' => 'required field',
          'product.*.quantity.required' => 'required',
          'product.*.quantity.integer' => 'required',
          'product.*.price.required' => 'required',
          'product.*.total_price.required' => 'required',
          'product.*.discount.regex' => 'invalid format',  
        ]);


        try{

            DB::beginTransaction();
           
           // customer adding  
            if($request->customer_type == 1){
                
                $customer_id = $request->customer_id;
            }
            else{

                $customer = new Customer;
                $customer->customer_name = $request->customer_name;
                $customer->email = $request->customer_email;
                $customer->phone = $request->customer_phone;
                $customer->address = $request->customer_address;

                $customer->save();

                $customer_id = $customer->id;


            }
            
 
           // invoice 

            $invoice = new Sell;

            $invoice->user_id = Auth::user()->id;  
            $invoice->customer_id = $customer_id;  
            $invoice->branch_id = Auth::user()->branch_id;  
            $invoice->branch_id = Auth::user()->branch_id;  
            $invoice->total_amount = $request->grand_total;  
            $invoice->discount_amount = $request->total_discount;  
            $invoice->paid_amount = $request->paid_amount;  
            $invoice->sell_date = $request->invoice_date;  
            $invoice->payment_method = $request->payment_info == 'cash' ? 1 : 2;
            if($request->paid_amount >= $request->grand_amount){
             $invoice->payment_status = 1; 
            } 
            else{
            $invoice->payment_status = 0;    
            }
            $invoice->save();


            // invoice details 

            // n $request->product;
            // return $stock = Stock::find($request->product[1]['chalan_id']);
            // exit();

            foreach ($request->product as  $value) {
                
               $stock = Stock::find($value['chalan_id']);

               $inv_details = new SellDetails;
               
               $inv_details->stock_id = $value['chalan_id'];
               $inv_details->sell_id = $invoice->id;
               $inv_details->product_id = $value['product_id'];
               $inv_details->category_id = $value['category'];
               $inv_details->customer_id = $customer_id;
               $inv_details->vendor_id = $stock->vendor_id;
               $inv_details->user_id = Auth::user()->id;
               $inv_details->chalan_no = $stock->chalan_no;
               $inv_details->selling_date = $request->invoice_date;
               $inv_details->sold_quantity = $value['quantity'];
               $inv_details->buy_price = $stock->buying_price;
               $inv_details->sold_price = $value['price'];
               $inv_details->total_buy_price = $stock->price*$value['quantity'];
               $inv_details->total_sold_price = $value['total_price'];
               $inv_details->discount = $value['discount'];
               $inv_details->discount_type = $value['discount_type'];
               $inv_details->discount_amount = $value['discount_amount'];

               $inv_details->save();

               $stock->current_quantity = $stock->current_quantity - $value['quantity'];

               $stock->update();

               
            
            }


            // payment history 

            if($request->paid_amount > 0){

                $payment = new Payment;

                $payment->sell_id = $invoice->id;
                $payment->customer_id = $customer_id;
                $payment->date = $request->invoice_date;
                $payment->paid_in = $request->payment_in;
                $payment->bank_information = $request->bank_info;
                $payment->amount = $request->paid_amount;
                $payment->save();

            }
             




             DB::commit();

            return response()->json(['status' => 'success', 'message' => 'Invoice Created !']);
            }
               catch(\Exception $e){
             
             DB::rollback();

             return $e;
             return response()->json(['status'=>'error','message'=>'Something Went Wrong!']);
        }
 
     
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
