<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class HomeController extends Controller
{
    public function index(){
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();
        
        $all_product = DB::table('tbl_product')
            ->join('tbl_brand','tbl_product.brand_id','=','tbl_brand.brand_id')
            ->join('tbl_category_product','tbl_product.category_id','=','tbl_category_product.category_id')
            ->where('tbl_category_product.category_status','0')
            ->where('tbl_brand.brand_status','0')
            ->where('tbl_product.product_status','0')->orderby('tbl_product.product_id','desc')->limit(20)->get();

        return view('pages.home')->with('category',$cate_product)->with('brand',$brand_product)->with('all_product',$all_product);
    }
    public function search(Request $request){
      $keywords = $request->keywords_submit;
      $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','asc')->get();
      $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','asc')->get();

      $search_product = DB::table('tbl_product')->where('product_name','like','%'.$keywords.'%')
        ->join('tbl_brand','tbl_product.brand_id','=','tbl_brand.brand_id')
        ->join('tbl_category_product','tbl_product.category_id','=','tbl_category_product.category_id')
        ->where('tbl_category_product.category_status','0')
        ->where('tbl_brand.brand_status','0')
        ->where('tbl_product.product_status','0')
        ->get();
        

      return view('pages.product.search')->with('category',$cate_product)->with('brand',$brand_product)->with('search_product',$search_product);
    }
}
