<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{


  // realtion with category 

  
  public function category(){

  	return $this->belongsTo('App\Category');
  } 	
     
   // realtion with stock 

   public function stock(){

     
     return $this->hasMany('App\Stock');  

   }


}
