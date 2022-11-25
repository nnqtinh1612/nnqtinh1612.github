<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use Auth;
session_start();

class AdminController extends Controller
{   
    public function AuthLogin(){
      $admin_id = Auth::id();
      if($admin_id){
        return Redirect::to('dashboard');
      }else{
        return Redirect::to('admin')->send();
      }
    }
    public function index(){
       return view('admin_login');
    }

    public function show_dashboard(){
      $this->AuthLogin();
      $all_pro = DB::table('tbl_product')->get();
      $all_cus = DB::table('tbl_customer')->get();
      $all_cont = DB::table('tbl_contact')->get();
      $all_or = DB::table('tbl_order')->get();
      return view('admin.dashboard')->with('all_pro',$all_pro)->with('all_cus',$all_cus)->with('all_cont',$all_cont)->with('all_or',$all_or);
    }

    public function dashboard(Request $request){
      if(Auth::attempt(['admin_email'=>$request->admin_email, 'admin_password'=>$request->admin_password])){
        return Redirect::to('/dashboard');
      }else{
        return Redirect::to('/admin')->with('message','Tài khoản hoặc mật khẩu sai');
      }

    }
    public function logout(){
      Session::flush();
      return Redirect::to('/admin');
    }
}
