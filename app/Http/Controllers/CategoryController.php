<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('category.category');
    }

    public function CategoryList(Request $request){

         
         $category = Category::orderBy('name','ASC');

         if($request->name != ''){
         
          $category->where('name','LIKE','%'.$request->name.'%');

         }

         $category = $category->paginate(10);

         return $category;

    }



    public function AllCategory(){

        $cat   = Category::all();


        return $cat;
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
         'name' => 'required|unique:categories'
        ]);

      
      try{
        $category = new Category;

        $category->name = $request->name;

        $category->save();

        return response()->json(['status'=>'success','message'=>'Category Added']);

      }
      catch(\Exception $e){

        return response()->json(['status'=>'error','message'=>'Something Went Wrong']);
      }
        






    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        return $category;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $request->validate([
         'name' => 'required|unique:categories'
        ]);

      
      try{
       
        $category->name = $request->name;

        $category->update();

        return response()->json(['status'=>'success','message'=>'Category Added']);

      }
      catch(\Exception $e){

        return response()->json(['status'=>'error','message'=>'Something Went Wrong']);
      }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {

        $check = Product::where('category_id','=',$category->id)->count();

        if($check>0){

          return response()->json(['status'=>'error','message'=>'This Category Has Product Delete Product First']);
        }
        try{
         
         $category->delete();
          
         return response()->json(['status'=>'success','message'=>'Category Deleted']);

         }

         catch(\Exception $e){

            return response()->json(['status'=>'error','message'=>'Something Went Wrong !']);
         }


    }
}
