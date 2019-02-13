<?php

namespace App\Http\Controllers;

use App\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return view('user.role');
    }


    public function RoleList(){

        $role = Role::all();

        return $role;
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
             'role_name' => 'required|unique:roles,role_name' 
        ]);

        $role = new Role;

        $role->role_name = $request->role_name;

        $role->save();

        return response()->json(['status'=>'success','message'=>'Role Saved']); 
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function show(Role $role)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function edit(Role $role)
    {
        return $role;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Role $role)
    {
          
        $request->validate([
             'role_name' => 'required|unique:roles,role_name' 
        ]);

        try{
        
        $role->role_name = $request->role_name;

        $role->save();

        return response()->json(['status'=>'success','message'=>'Role Updated']);
        }
        catch(\Exception $e)
        {

        return response()->json(['status'=>'error','message'=>'Something Went Wrong!']);

        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy(Role $role)
    {
        
        try{

            $role->delete();

            return response()->json(['status'=>'success','Delete Success!']);
        }
        catch(\Exception $e){

            return response()->json(['status'=>'error','Something Went Wrong!']);
          

        }

    }
}
