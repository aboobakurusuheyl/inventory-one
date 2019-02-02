<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;




    // realtion with Stock


    public function stock(){
       
       return $this->hasMany('App\Stock');

    }
   
    // relationt with sell
    public function Sell(){

        return $this->hasMany('App\Sell');
    } 

    // relation with payment 


    public function payment(){

        return $this->hasMany('App\Payment');
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}
