<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use Cart;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use App\Order;
use App\Product;
use Auth;
session_start();

class CheckoutController extends Controller
{   
    public function AuthLogin(){
      $admin_id = Auth::user('admin_id');
      if($admin_id){
        return Redirect::to('dashboard');
      }else{
        return Redirect::to('admin')->send();
      }
    }
    public function login_checkout(){
        return view('pages.checkout.login_checkout');
    }
    public function register_checkout(){

        return view('pages.checkout.register_checkout');
    }
    public function add_customer(Request $request){
        $data = array();
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $data['customer_name'] = $request->customer_name;
        $data['customer_user'] = $request->customer_user;
        $data['customer_password'] = md5($request->customer_password);
        $data['customer_phone'] = $request->customer_phone;
        $data['created_at'] = now();

        $user_customer = $request->customer_user;
        $results = DB::table('tbl_customer')->where('customer_user',$user_customer)->first();
        if($results){
            Session::put('message','Tài khoản đã tồn tại. Vui lòng nhập lại !!');
            return Redirect::to('/register-checkout');
        }else{
            $customer_id = DB::table('tbl_customer')->insertGetId($data);

            Session::put('customer_id',$customer_id);
            Session::put('customer_name',$request->customer_name);
            return Redirect::to('/');
        }
    }
    public function checkout(){
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();

        $count_cart = Cart::count();
        if($count_cart != 0){
            return view('pages.checkout.show_checkout')->with('category',$cate_product)->with('brand',$brand_product);
        }else{
            Session::put('message','Giỏ hàng trống. Vui lòng chọn sản phẩm để tiếp tục mua hàng !!');
            return Redirect::to('/show-cart');
        }

        
    }
    public function save_checkout_customer(Request $request){
        $data = array();
        $data['shipping_name'] = $request->shipping_name;
        $data['shipping_email'] = $request->shipping_email;
        $data['shipping_phone'] = $request->shipping_phone;
        $data['shipping_note'] = $request->shipping_note;
        $data['shipping_address'] = $request->shipping_address;
        $data['shipping_method'] = $request->shipping_method;


        $shipping_id = DB::table('tbl_shipping')->insertGetId($data);

        Session::put('shipping_id',$shipping_id);

        //insert order
        $checkout_code = substr(md5(microtime()),rand(0,26),5);
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $order_data = array();
        $order_data['customer_id'] = Session::get('customer_id');
        $order_data['shipping_id'] = Session::get('shipping_id');
        $order_data['order_total'] = Cart::subtotal();
        $order_data['order_status'] = 1;
        $order_data['order_code'] = $checkout_code;
        $order_data['created_at'] = now();
        $order_id = DB::table('tbl_order')->insertGetId($order_data);

        //insert order detail
        $content = Cart::content();
        foreach($content as $v_content){
            $order_detail_data = array();
            $order_detail_data['order_id'] = $order_id;
            $order_detail_data['order_code'] = $checkout_code;
            $order_detail_data['product_id'] = $v_content->id;
            $order_detail_data['product_name'] = $v_content->name;
            $order_detail_data['product_price'] = $v_content->price;
            $order_detail_data['product_sale_quantity'] = $v_content->qty;
            DB::table('tbl_order_detail')->insert($order_detail_data);
        }
            Cart::destroy();
            $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
            $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();
            return view('pages.checkout.handcash')->with('category',$cate_product)->with('brand',$brand_product);
    }
    
    public function logout_checkout(){
        Session::flush();
        return Redirect('/');
    }
    public function login_customer(Request $request){
        $user = $request->user_account;
        $password = md5($request->password_account);

        $result = DB::table('tbl_customer')->where('customer_user',$user)->where('customer_password',$password)->first();
        
        if($result){
            Session::put('customer_id',$result->customer_id);
            Session::put('customer_name',$result->customer_name);
            return Redirect::to('/');
        }else{
            
            Session::put('message','Tài khoản hoặc mật khẩu sai !!');
            return Redirect::to('/login-checkout');
        }
    }


    //Order backend
    public function manage_order(){
        $this->AuthLogin();
        $all_order = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->select('tbl_order.*','tbl_customer.customer_name')
            ->orderby('tbl_order.order_id','desc')->paginate(10);
        $manager_order = view('admin.manage_order')->with('all_order',$all_order);
        return view('admin_layout')->with('admmin.manage_order',$manager_order);
    }
    public function view_order($order_code){
        $this->AuthLogin();
        $order_by_code = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_order_detail','tbl_order.order_code','=','tbl_order_detail.order_code')
            ->select('tbl_order.*','tbl_customer.*','tbl_shipping.*','tbl_order_detail.*')
            ->where('tbl_order.order_code',$order_code)->first(); 
        $order = DB::table('tbl_order')
            ->join('tbl_order_detail','tbl_order.order_code','=','tbl_order_detail.order_code')
            ->where('tbl_order.order_code',$order_code)->limit(1)->get();
        $order_detail = DB::table('tbl_order')
            ->join('tbl_order_detail','tbl_order.order_code','=','tbl_order_detail.order_code')
            ->join('tbl_product','tbl_order_detail.product_id','=','tbl_product.product_id')
            ->select('tbl_order.*','tbl_order_detail.*','tbl_product.product_quantity')
            ->where('tbl_order.order_code',$order_code)->get();

        $manager_order_by_code = view('admin.view_order')->with('order_by_code',$order_by_code)->with('order_detail',$order_detail)->with('order',$order);
        return view('admin_layout')->with('admmin.view_order',$manager_order_by_code);
    }
    public function update_order_qty(Request $request){
        // update order
        $update_order_data = $request->all();
        $order = Order::find($update_order_data['order_id']);
        $order->order_status = $update_order_data['order_status'];
        $order->save();
        if($order->order_status == 2){
            foreach($update_order_data['order_product_id'] as $key => $product_id){
                $product = Product::find($product_id);
                $product_quantity = $product->product_quantity;
                $product_sold = $product->product_sold;
                foreach($update_order_data['quantity'] as $key2 => $qty){
                    if($key == $key2){
                        $pro_remain = $product_quantity - $qty;
                        $product->product_quantity = $pro_remain;
                        $product->product_sold = $product_sold + $qty;
                        $product->save();
                    }
                }
            }
        }
    }
    

    //show order frontend
    public function show_info_order(){
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();

        $customer_id = Session::get('customer_id');
        $customer = DB::table('tbl_customer')
            ->join('tbl_order','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->orderby('tbl_order.order_id','desc')
            ->where('tbl_customer.customer_id',$customer_id)
            ->get();
        $customer_info = DB::table('tbl_customer')
            ->where('customer_id',$customer_id)
            ->get();
        return view('pages.information.show_info_order')->with('category',$cate_product)->with('brand',$brand_product)->with('customer',$customer)->with('customer_info',$customer_info);
    }
    public function show_order_detail($order_code){
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();

        $order_detail_by_code = DB::table('tbl_order')
            ->join('tbl_order_detail','tbl_order.order_code','=','tbl_order_detail.order_code')
            ->join('tbl_product','tbl_order_detail.product_id','=','tbl_product.product_id')
            ->where('tbl_order.order_code',$order_code)
            ->get();
        $shipping_by_code = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_order_detail','tbl_order.order_code','=','tbl_order_detail.order_code')
            ->select('tbl_order.*','tbl_customer.*','tbl_shipping.*','tbl_order_detail.*')
            ->where('tbl_order.order_code',$order_code)->first(); 

        return view('pages.information.show_order_detail')->with('category',$cate_product)->with('brand',$brand_product)->with('order_detail_by_code',$order_detail_by_code)->with('shipping_by_code',$shipping_by_code);
    }
}
