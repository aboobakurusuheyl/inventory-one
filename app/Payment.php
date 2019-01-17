<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    // realtion with customer 


    public function customer(){

    	return $this->belongsTo('App\Customer');
    }
}
