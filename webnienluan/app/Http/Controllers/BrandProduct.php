<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use Auth;
session_start();

class BrandProduct extends Controller
{   
    public function AuthLogin(){
      $admin_id = Auth::id();
      if($admin_id){
        return Redirect::to('dashboard');
      }else{
        return Redirect::to('admin')->send();
      }
    }
    public function add_brand_product(){
        $this->AuthLogin();
        return view('admin.add_brand_product');
    }

    public function all_brand_product(){
        $this->AuthLogin();
        $all_brand_product = DB::table('tbl_brand')->orderby('brand_id','desc')->paginate(10);
        $manager_brand_product = view('admin.all_brand_product')->with('all_brand_product',$all_brand_product);
        return view('admin_layout')->with('admmin.all_brand_product',$manager_brand_product);
    }
    public function save_brand_product(Request $request){
        $this->AuthLogin();
        $data = array();
        $data['brand_name'] = $request->brand_product_name;
        $data['brand_desc'] = $request->brand_product_desc;
        $data['brand_status'] = $request->brand_product_status;
        
        DB::table('tbl_brand')->insert($data);
        Session::put('message','Thêm thương hiệu sản phẩm thành công');
        return Redirect::to('add-brand-product');
    }
    public function unactive_brand_product($brand_product_id){
        $this->AuthLogin();
        DB::table('tbl_brand')->where('brand_id',$brand_product_id)->update(['brand_status'=>1]);
        Session::put('message','Thương hiệu sản phẩm đã được ẩn');
        return Redirect::to('all-brand-product');
    }
    public function active_brand_product($brand_product_id){
        $this->AuthLogin();
        DB::table('tbl_brand')->where('brand_id',$brand_product_id)->update(['brand_status'=>0]);
        Session::put('message','Thương hiệu sản phẩm đã được hiển thị');
        return Redirect::to('all-brand-product');
    }
    public function edit_brand_product($brand_product_id){
        $this->AuthLogin();
        $edit_brand_product = DB::table('tbl_brand')->where('brand_id',$brand_product_id)->get();
        $manager_brand_product = view('admin.edit_brand_product')->with('edit_brand_product',$edit_brand_product);
        return view('admin_layout')->with('admmin.edit_brand_product',$manager_brand_product);
    }
    public function update_brand_product(Request $request, $brand_product_id){
        $this->AuthLogin();
        $data = array();
        $data['brand_name'] = $request->brand_product_name;
        $data['brand_desc'] = $request->brand_product_desc;
        DB::table('tbl_brand')->where('brand_id',$brand_product_id)->update($data);
        Session::put('message','Cập nhật thương hiệu sản phẩm thành công');
        return Redirect::to('all-brand-product');
    }
    public function delete_brand_product($brand_product_id){
        $this->AuthLogin();
        $brand = DB::table('tbl_order_detail')
            ->join('tbl_product','tbl_product.product_id','=','tbl_order_detail.product_id')
            ->where('tbl_product.brand_id',$brand_product_id)
            ->first();
        if($brand){
            Session::put('message','Xóa thương hiệu sản phẩm không thành công');
            return Redirect::to('all-brand-product');
        }else{
            DB::table('tbl_brand')->where('brand_id',$brand_product_id)->delete();
            Session::put('message','Xóa thương hiệu sản phẩm thành công');
            return Redirect::to('all-brand-product');
        }
    }
    //End function admin page


    //Home_brand
    public function show_brand_home($brand_id){
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();

        $brand_by_id = DB::table('tbl_product')
            ->join('tbl_brand','tbl_product.brand_id','=','tbl_brand.brand_id')
            ->join('tbl_category_product','tbl_product.category_id','=','tbl_category_product.category_id')
            ->where('tbl_product.brand_id',$brand_id)
            ->where('tbl_category_product.category_status','0')
            ->where('tbl_product.product_status','0')->get();
        $brand_name = DB::table('tbl_brand')->where('tbl_brand.brand_id',$brand_id)->limit(1)->get();
        return view('pages.brand.show_brand')->with('category',$cate_product)->with('brand',$brand_product)->with('brand_by_id',$brand_by_id)->with('brand_name',$brand_name);
    }
}
