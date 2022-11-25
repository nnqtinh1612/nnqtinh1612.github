<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use Auth;
session_start();

class AuthController extends Controller
{
    public function register_auth(){
      return view('/admin.auth.register');
    }
    public function add_auth(Request $request){
      $data = array();
      $data['admin_name'] = $request->admin_name;
      $data['admin_email'] = $request->admin_email;
      $data['admin_password'] = md5($request->admin_password);
      $data['admin_phone'] = $request->admin_phone;
        
        $email_admin = $request->admin_email;
        $results = DB::table('tbl_admin')->where('admin_email',$email_admin)->first();
        if ($results) {
            Session::put('message','Tài khoản email đã tồn tại. Vui lòng nhập lại !!');
            return Redirect::to('/register-auth');
        }else{

            $admin_id = DB::table('tbl_admin')->insertGetId($data);

            Session::put('admin_id',$admin_id);
            Session::put('admin_name',$request->admin_name);
            Session::put('message','Đăng ký thành công. Vui lòng nhập lại !!');
            return Redirect::to('admin');

        }
    }
   
}
 