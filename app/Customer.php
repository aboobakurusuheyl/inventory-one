<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
   // relation with sell 

	public function sell(){
       
       return $this->hasMany('App\Sell');
	}
}
