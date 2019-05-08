<?php

namespace App\Http\Controllers;

use App\Stock;
use App\Product;
use App\Vendor;
use App\SellDetails;
use App\Category;
use Illuminate\Http\Request;
use Auth;
use DB;

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
     $category = Category::orderBy('name','asc')->get();
     $product = Product::orderBy('product_name','asc')->get();
     return view('stock.stock',[
      'vendor'=>$vendor,
      'category'=>$category,
      'product'=>$product,
    ]);
   }


   public function StockList(Request $request){


     $stock = Stock::with([
      'product'=>function($query){
        $query->select('id','product_name');
      },
      'vendor'=>function($query){
        $query->select('id','name');
      },
      'user'=> function($query){

        $query->select('id','name');
      },
      'category'=> function($query){

        $query->select('id','name');
      }
    ]
  )
     ->orderBy('updated_at','desc');


     if($request->category != ''){

       $stock->where('category_id','=',$request->category);

     }

     if($request->product != ''){

      $stock->where('product_id','=',$request->product);

    }

    if($request->vendor != ''){

      $stock->where('vendor_id','=',$request->vendor);

    }

    $stock = $stock->paginate(10);

    return $stock;            

  }


  public function ChalanList($id){

   $chalan = Stock::where('product_id','=',$id)
             ->where('current_quantity','>',0)
   // ->withCount([
   //  'sell_details AS sold_qty' => function ($query) use ($id){

   //    $query->select(DB::raw("COALESCE(SUM(sold_quantity),0)"));

   //  }])
   ->orderBy('updated_at','desc')
   ->get();


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
        'category' => 'required',
        'quantity' => 'required|integer',
        'buying_price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
        'selling_price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',

      ]);

      try{



        $stock = new Stock;   
        $stock->category_id = $request->category;
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

        Stock::where('product_id','=',$request->product)
        ->where('current_quantity','>',0)
        ->update(['selling_price'=>$request->selling_price]);

        return response()->json(['status'=>'success','message'=>'Product Added To Stock']);

      }
      catch(\Exception $e){
        return $e;
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

      return $stock;

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function edit($stock)
    {
      return $stock = Stock::with('product')->where('id','=',$stock)->first();
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

     $request->validate([
      'category'=>'required',
      'product'=>'required',
      'vendor'=>'required',
      'buying_price'=>'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
      'selling_price'=>'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
    ]);


     try{

      $stock->category_id = $request->category;
      $stock->product_id = $request->product;
      $stock->vendor_id = $request->vendor;
      $stock->buying_price = $request->buying_price;
      $stock->selling_price = $request->selling_price;
      $stock->note = $request->note;
      $stock->update();

      return response()->json(['status'=>'success','message'=>'Stock Updated']);

    }
    catch(\Exception $e){

      return response()->json(['status'=>'error','message'=>'Problem To Update Stock']);


    }




  }

  public function StockUpdate(Request $request){



    $request->validate([

      'new_qty'=>'required|integer',
      'state'=>'required',
    ]);

    $stock = Stock::find($request->id);

    if($request->state == '+'){

     $stock->current_quantity = $stock->current_quantity+$request->new_qty;
     $stock->stock_quantity = $stock->stock_quantity+$request->new_qty;

     $stock->update();

     return response()->json(['status'=>'success','message'=>'Quantity Updated']);
   }

   else{

    if($request->new_qty > $stock->current_quantity){

      return response()->json(['status'=>'error','message'=>'quantity is greater then current quantity']);

    }

    else{

     $stock->current_quantity = $stock->current_quantity-$request->new_qty;
     $stock->stock_quantity = $stock->stock_quantity-$request->new_qty;

     $stock->update();

     return response()->json(['status'=>'success','message'=>'Quantity Updated']);

   }


 }



}

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Stock  $stock
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

      $check = SellDetails::where('stock_id','=',$id)->count();

      if($check > 0){


       return response()->json(['status'=>'error','message','This Chalan Has Sells Record Delete Sold Item First']);

     }


     try{

       Stock::where('id', '=', $id)->delete();
       return response()->json(['status'=>'success','message','Delete success !']);

     }
     catch(\Exception $e){

      return response()->json(['status'=>'error','message','Something Went Wrong !']);

    }




  }
}
