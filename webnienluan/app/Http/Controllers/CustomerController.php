<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use Auth;
session_start();

class CustomerController extends Controller
{
    public function AuthLogin(){
      $admin_id = Auth::id();
      if($admin_id){
        return Redirect::to('dashboard');
      }else{
        return Redirect::to('admin')->send();
      }
    }
    public function all_customer(){
        $this->AuthLogin();
        $all_customer = DB::table('tbl_customer')->orderby('customer_id','desc')->paginate(10);
        $manager_customer = view('admin.customer.all_customer')->with('all_customer',$all_customer);
        return view('admin_layout')->with('admmin.customer.all_customer',$manager_customer);
    }
    public function delete_customer($customer_id){
        $cus = DB::table('tbl_order')->where('customer_id',$customer_id)->where('order_status',"1")->first();
        if($cus){
            Session::put('message','Xóa tài khoản thành viên không thành công');
            return Redirect::to('all-customer');
        }else{
            DB::table('tbl_customer')->where('customer_id',$customer_id)->delete();
            Session::put('message','Xóa tài khoản thành viên thành công');
            return Redirect::to('all-customer');
        }
    }
    public function customer_order($customer_id){
        $customer_order = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->orderby('tbl_order.order_id','desc')
            ->where('tbl_customer.customer_id',$customer_id)
            ->paginate(10);
        $manager_order_customer = view('admin.customer.customer_order')->with('customer_order',$customer_order);
        return view('admin_layout')->with('admmin.admin.customer_order',$manager_order_customer);
    }
}
