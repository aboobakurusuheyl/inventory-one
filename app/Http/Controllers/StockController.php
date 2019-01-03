<?php

namespace App\Http\Controllers;

use App\Stock;
use App\Product;
use App\Vendor;
use App\SellDetails;
use Illuminate\Http\Request;
use Auth;

class StockController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       

       $vendor = Vendor::orderBy('name','asc')->get();
       $product = Product::orderBy('product_name','asc')->get();
       return view('stock.stock',['vendor'=>$vendor,'product'=>$product]);
    }


    public function StockList(Request $request){
          

       $stock = Stock::with('product')
                  ->selectRaw('sum(stock_quantity) as stock_quantity,sum(current_quantity) as current_quantity,product_id');
          

          if($request->product != ''){
             
             $stock->where('product_id','=',$request->product);

            }

            // if($request->start_date != '' && $request->end_date != ''){

            //      $start_date = $request->start_date.' 12:01:01';
            //      $end_date = $request->end_date.' 23:59:59';

            //    $stock->whereBetween('created_at',[$start_date,$end_date]);
            //   } 

               $stock = $stock->groupBy('product_id')
                         ->paginate(10);

             return $stock;            

    }


    public function ChalanList($id){
         
     
     $chalan = Stock::with(['vendor','user','product'])->where('product_id','=',$id)->orderBy('id','desc')->get();


     return $chalan;


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
          
          'product' => 'required',
          'vendor' => 'required',
          'quantity' => 'required|integer',
          'buying_price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
          'selling_price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',

        ]);
        
        try{



          $stock = new Stock;   
          $stock->product_id = $request->product;
          $stock->product_code = time();
          $stock->vendor_id = $request->vendor;
          $stock->user_id = Auth::user()->id;
          $stock->buying_price = $request->buying_price;
          $stock->selling_price = $request->selling_price;
          $stock->chalan_no = date('Y-m-d');
          $stock->stock_quantity = $request->quantity;
          $stock->current_quantity = $request->quantity;
          $stock->discount = 0;
          $stock->note = $request->note;
          $stock->status = 1;
          $stock->save();

          return response()->json(['status'=>'success','message'=>'Product Added To Stock']);

        }
        catch(\Exception $e){
            
            return response()->json(['status'=>'error','message'=>'Problem To Update Stock']);


        }
       






    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function show(Stock $stock)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function edit(Stock $stock)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Stock $stock)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
        $check = SellDetails::where('product_id','=',$id)->count();

         if($check > 0){
           

           return response()->json(['status'=>'error','message','This Product Has Sells Record']);

         }


         try{
            
             Stock::where('product_id', '=', $id)->delete();
             return response()->json(['status'=>'success','message','Delete success !']);

         }
         catch(\Exception $e){
          
          return response()->json(['status'=>'error','message','Something Went Wrong !']);

         }

        


    }
}
