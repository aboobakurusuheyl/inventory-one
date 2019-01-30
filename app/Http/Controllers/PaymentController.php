<?php

namespace App\Http\Controllers;

use App\Payment;
use Illuminate\Http\Request;
use App\Sell;
use App\SellDetails;
use Auth;

class PaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
          'payment_date' => 'required',
          'payment_amount' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',          
          'payment_in' => 'required',                 
        ]);

        try{
          
          $sell = Sell::find($request->id);

          $payment = new Payment;

          $payment->sell_id = $request->id;
          $payment->customer_id = $sell->customer_id;
          $payment->user_id = Auth::user()->id;
          $payment->date = $request->payment_date;
          $payment->amount = $request->payment_amount;
          $payment->paid_in = $request->payment_in;
          $payment->bank_information = $request->bank_info;

          $payment->save();

          $paid_amount = $sell->paid_amount+$request->payment_amount;

          if($paid_amount>=$sell->total_amount){
            
            $sell->payment_status = 1;
          }

          $sell->paid_amount = $paid_amount;

          $sell->save();

          return response()->json(['status'=>'success','message'=>'Payment Success']);



        }
        catch(\Exception $e){
          
          return response()->json(['status'=>'error','message'=>'Something Went Wrong']);

        

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show(Payment $payment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function edit(Payment $payment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Payment $payment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Payment $payment)
    {
        //
    }
}
