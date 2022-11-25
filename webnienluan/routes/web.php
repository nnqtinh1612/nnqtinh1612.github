<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//frontend
Route::get('/', 'HomeController@index' );
Route::get('/trangchu', 'HomeController@index');
Route::post('/tim-kiem', 'HomeController@search');


//trang chu - danh muc san pham 
Route::get('/danh-muc-san-pham/{category_id}', 'CategoryProduct@show_category_home');
Route::get('/thuong-hieu-san-pham/{brand_id}', 'BrandProduct@show_brand_home');
Route::get('/chi-tiet-san-pham/{product_id}', 'ProductController@details_product');


//contact
Route::get('/lien-he', 'ContactController@contact');
Route::post('/save-lien-he', 'ContactController@save_contact');
Route::get('/all-contact', 'ContactController@all_contact');
Route::get('/tin-tuc', 'ContactController@news');



//backend
Route::get('/admin', 'AdminController@index');
Route::get('/dashboard', 'AdminController@show_dashboard');
Route::get('/logout', 'AdminController@logout');
Route::post('/admin-dashboard', 'AdminController@dashboard');


//auth
Route::get('/register-auth', 'AuthController@register_auth');
Route::post('/add-auth', 'AuthController@add_auth');


//customer
Route::get('/all-customer', 'CustomerController@all_customer');
Route::get('/delete-customer/{customer_id}', 'CustomerController@delete_customer');
Route::get('/customer-order/{customer_id}', 'CustomerController@customer_order');



//category product
Route::get('/add-category-product', 'CategoryProduct@add_category_product');
Route::get('/edit-category-product/{category_product_id}', 'CategoryProduct@edit_category_product');
Route::get('/delete-category-product/{category_product_id}', 'CategoryProduct@delete_category_product');
Route::get('/all-category-product', 'CategoryProduct@all_category_product');

Route::get('/unactive-category-product/{category_product_id}', 'CategoryProduct@unactive_category_product');
Route::get('/active-category-product/{category_product_id}', 'CategoryProduct@active_category_product');

Route::post('/save-category-product', 'CategoryProduct@save_category_product');
Route::post('/update-category-product/{category_product_id}', 'CategoryProduct@update_category_product');


//brand product
Route::get('/add-brand-product', 'BrandProduct@add_brand_product');
Route::get('/edit-brand-product/{brand_product_id}', 'BrandProduct@edit_brand_product');
Route::get('/delete-brand-product/{brand_product_id}', 'BrandProduct@delete_brand_product');
Route::get('/all-brand-product', 'BrandProduct@all_brand_product');

Route::get('/unactive-brand-product/{brand_product_id}', 'BrandProduct@unactive_brand_product');
Route::get('/active-brand-product/{brand_product_id}', 'BrandProduct@active_brand_product');

Route::post('/save-brand-product', 'BrandProduct@save_brand_product');
Route::post('/update-brand-product/{brand_product_id}', 'BrandProduct@update_brand_product');


//product
Route::get('/add-product', 'ProductController@add_product');
Route::get('/edit-product/{product_id}', 'ProductController@edit_product');
Route::get('/delete-product/{product_id}', 'ProductController@delete_product');
Route::get('/all-product', 'ProductController@all_product');

Route::get('/unactive-product/{product_id}', 'ProductController@unactive_product');
Route::get('/active-product/{product_id}', 'ProductController@active_product');

Route::post('/save-product', 'ProductController@save_product');
Route::post('/update-product/{product_id}', 'ProductController@update_product');



//cart
Route::post('/save-cart', 'CartController@save_cart');
Route::post('/update-cart-quantity', 'CartController@update_cart_quantity');
Route::get('/show-cart', 'CartController@show_cart');
Route::get('/delete-to-cart/{rowId}', 'CartController@delete_to_cart');



//checkout
Route::get('/login-checkout', 'CheckoutController@login_checkout');
Route::get('/register-checkout', 'CheckoutController@register_checkout');
Route::get('/logout-checkout', 'CheckoutController@logout_checkout');
Route::get('/checkout', 'CheckoutController@checkout');
Route::post('/order-place', 'CheckoutController@order_place');
Route::post('/add-customer', 'CheckoutController@add_customer');
Route::post('/login-customer', 'CheckoutController@login_customer');
Route::post('/save-checkout-customer', 'CheckoutController@save_checkout_customer');


//order
Route::get('/manage-order', 'CheckoutController@manage_order');
Route::get('/view-order/{order_code}', 'CheckoutController@view_order');
Route::post('/update-order-qty', 'CheckoutController@update_order_qty');
Route::get('/show-info-order', 'CheckoutController@show_info_order');
Route::get('/show-order-detail/{order_code}', 'CheckoutController@show_order_detail');
