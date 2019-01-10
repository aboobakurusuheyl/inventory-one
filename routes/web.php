<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::group(['middleware'=>'auth'],function(){

Route::get('/', function () {
    return view('welcome');
});

// vendor 

Route::resource('supplier','VendorController');
Route::get('vendor-list','VendorController@Vendor');

// product category 

Route::resource('category','CategoryController');

Route::get('category-list','CategoryController@CategoryList');

Route::get('all-category','CategoryController@AllCategory');

// product 
Route::resource('product','ProductController');
Route::get('product-list','ProductController@ProductList');

Route::get('category/product/{id}','ProductController@productByCategory');



// customer 
Route::resource('customer','CustomerController');

//Stock

Route::resource('stock','StockController');

Route::get('stock-list','StockController@StockList');
Route::get('chalan-list/chalan/{id}','StockController@ChalanList');

Route::get('stock-asset','StockController@StockAsset');

Route::post('stock-update','StockController@StockUpdate');


Route::resource('invoice','InvoiceController');

Route::get('get/invoice/number','InvoiceController@getLastInvoice');


Route::get('logout','UserController@logout');

});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
