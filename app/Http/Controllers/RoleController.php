<?php

namespace App\Http\Controllers;

use App\Role;
use App\Menu;
use App\Permission;
use DB;
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
    public function show($id)
    {
         $menu = Menu::select('id','name','parent_id')->orderBy('parent_id','asc')->get(); 
        $permission = Permission::where('role_id','=',$id)->pluck('menu_id')->toArray();


         $men = [];
         $menus = [];


         foreach ($menu as $key => $value) {
            
           
           $men['id'] = $value->id;
           $men['name'] = $value->name;
           $men['parent_id'] = $value->parent_id;

           if(count($permission) < 0){

            $men['check'] = false;

           }
           else{
             
             if(in_array($value->id, $permission)){
                
                $men['check'] = true;

             }
             else{

               $men['check'] = false; 
             }



           }

          array_push($menus,$men);


         }

         return $menus;




    }


    public function Permission(Request $request){

       try{
        
        DB::beginTransaction();

      Permission::where('role_id','=',$request->id)->delete();
      
      // getting only check item from menus 
      $menus = array_filter($request->menus, function ($var) {
          return ($var['check'] == true);
         });
       
       // finding only the id colum of manu   
       $menu_id = array_column($menus, 'id');

       foreach ($menu_id as  $value) {
          
         $permission = new Permission;

         $permission->role_id = $request->id;  
         $permission->menu_id = $value; 

         $permission->save(); 

        }

        DB::commit();

        return response()->json(['status'=>'success','message'=>'New Permission Given']);

       }
       catch(\Exception $e)
       {

        DB::rollBack();
       return response()->json(['status'=>'error','message'=>'Something Went Wrong !']);



       }

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
