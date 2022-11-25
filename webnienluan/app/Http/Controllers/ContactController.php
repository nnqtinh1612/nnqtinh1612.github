<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();
use Auth;

class ContactController extends Controller
{
    public function AuthLoginCus(){
      $customer_id = Session::get('customer_id');
      if($customer_id){
        return Redirect::to('/');
      }else{
        return Redirect::to('login-checkout')->send();
      }
    }
    public function AuthLogin(){
      $admin_id = Auth::id();
      if($admin_id){
        return Redirect::to('dashboard');
      }else{
        return Redirect::to('admin')->send();
      }
    }
    public function contact(){
        $this->AuthLoginCus();
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();
        return view('pages.contact.contact_us')->with('category',$cate_product)->with('brand',$brand_product);
    }
    public function save_contact(Request $request){
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();
        Session::get('customer_id');
        $data = array();
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $data['customer_id'] = Session::get('customer_id');
        $data['contact_name'] = $request->contact_name;
        $data['contact_email'] = $request->contact_email;
        $data['contact_phone'] = $request->contact_phone;
        $data['contact_desc'] = $request->contact_desc;
        $data['created_at'] = now();

        $contact_id = DB::table('tbl_contact')->insertGetId($data);

        Session::put('contact_id',$contact_id);
        return view('pages.contact.show_contact')->with('category',$cate_product)->with('brand',$brand_product);
    }

    // backend
    public function all_contact(){
        $this->AuthLogin();
        $all_contact = DB::table('tbl_contact')->orderby('contact_id','desc')->paginate(10);
        $manager_contact = view('admin.all_contact')->with('all_contact',$all_contact);
        return view('admin_layout')->with('admmin.all_contact',$manager_contact);
    }
    public function news(){
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();
        return view('pages.contact.news')->with('category',$cate_product)->with('brand',$brand_product);
    }
}
