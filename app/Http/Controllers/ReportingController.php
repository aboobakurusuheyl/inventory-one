<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Customer;
use App\Payment;
use App\Product;
use App\Sell;
use App\SellDetails;
use App\Stock;
use App\User;
use App\Vendor;
use DB;
use Auth;

class ReportingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return view('report.report');
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
          'start_date' => 'required',
          'end_date' => 'required',
          'type' => 'required',
        ]);


        $type = $request->type;
        $start_date = date("Y-m-d", strtotime($request->start_date));
        $end_date = date("Y-m-d", strtotime($request->end_date));

        $page = '';

        if($type == 'sell'){
         
         $data = SellDetails::with('product:id,product_name')
         ->select('product_id',
          DB::raw('SUM(sold_quantity) as total_quantity'),
          DB::raw('SUM(total_buy_price) as total_buy_price'),
          DB::raw('SUM(total_sold_price) as total_sold_price'),
          DB::raw('SUM(discount_amount) as total_discount_amount')
         )
         ->groupBy('product_id')
         ->whereBetween('selling_date',[$start_date,$end_date])
         ->get();

          $page = 'report.sell';

        }

        if($type == 'invoice'){
            
            $data = Sell::with(['customer:id,customer_name','user:id,name'])
                          ->whereBetween('sell_date',[$start_date,$end_date])
                          ->get();

           $page = 'report.invoice';              

        }

       if($type == 'due'){
          
         return  $data = Sell::with('customer:id,customer_name')
                        ->select('customer_id',
                          DB::raw('SUM(total_amount) as total_amount'),
                          DB::raw('SUM(paid_amount) as paid_amount')
                         )
                        ->where('payment_status','=',0)
                        ->whereBetween('sell_date',[$start_date,$end_date])
                        ->groupBy('customer_id')
                        ->get();

         $page = 'report.due';  
        }

        if($type == 'profit'){
         
         $data = SellDetails::with('product:id,product_name')
                             ->select('product_id',
                             DB::raw('SUM(sold_quantity) as total_quantity'),
                             DB::raw('SUM(total_buy_price) as total_buy_price'),
                             DB::raw('SUM(total_sold_price) as total_sold_price'),
                             DB::raw('SUM(discount_amount) as total_discount_amount')
                             )
                            ->groupBy('product_id')
                            ->whereBetween('selling_date',[$start_date,$end_date])
                            ->get();

          $page = 'report.profit';

        }

        return view($page,[
            'data'=>$data,
            'start_date'=>$start_date,
            'end_date'=>$end_date,
            'type' => $type
        ]);


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
