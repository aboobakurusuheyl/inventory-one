<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    
    // relation with product 
    public function product(){

    	return $this->belongsTo('App\Product');
    }

    // relation with user 


    public function user(){

    	return $this->belongsTo('App\User');
    }

    // realtion with vendor 

    public function vendor(){

    	return $this->belongsTo('App\Stock');
    }
}
