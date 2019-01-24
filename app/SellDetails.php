<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SellDetails extends Model
{
   
   // relation with stock 


	public function stock(){

		return $this->belongsTo('App\Stock');
	}
}
