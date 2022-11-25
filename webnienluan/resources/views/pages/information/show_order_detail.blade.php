@extends('welcome')
@section('content')

<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="{{URL::to('show-info-order')}}">Thông tin</a></li>
				  <li class="active">Chi tiết đơn hàng</li>
				  
				</ol>
			</div>
			<h2 class="title text-center">thông tin vận chuyển</h2>
			<div class="table-responsive cart_info" style="border:1px hidden;">
				
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Tên người nhận</td>
							<td class="description">Email</td>
							<td class="price">Địa chỉ</td>
							<td class="quantity">Số điện thoại</td>
							<td class="total">Phương thức thanh toán</td>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<td class="cart_product" style="font-size:16px;font-weight: 500;">{{$shipping_by_code->shipping_name}}</td>
							<td class="shipping_detail">{{$shipping_by_code->shipping_email}}</td>
							<td class="shipping_detail">{{$shipping_by_code->shipping_address}}</td>
							<td class="shipping_detail">{{$shipping_by_code->shipping_phone}}</td>
							<td class="shipping_detail">
								@if($shipping_by_code->shipping_method==1)
				                	Thanh toán bằng thẻ ATM
				              	@else
				                	Thanh toán khi nhận hàng
				              	@endif
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>



			<h2 class="title text-center">Chi tiết đơn hàng</h2>
			<div class="table-responsive cart_info" style="border:1px hidden;">
				
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Hình ảnh</td>
							<td class="description">Tên sản phẩm</td>
							<td class="price">Giá</td>
							<td class="quantity">Số lượng</td>
							<td class="total">Tổng tiền</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						@foreach($order_detail_by_code as $val_order)
						@php
						$subtotal = $val_order->product_price * $val_order->product_sale_quantity;
						@endphp
						<tr>
							<td class="cart_product">
								<a href=""><img src="{{URL::to('public/uploads/product/'.$val_order->product_image)}}" width="60px" alt="" /></a>
							</td>
							<td class="cart_description">
								<h4><a href="">{{$val_order->product_name}}</a></h4>
							</td>
							<td class="cart_price">
								<p>{{number_format($val_order->product_price).' VNĐ'}}</p>
							</td>
							<td class="cart_quantity" style="font-size: 17px;">
								<p>{{$val_order->product_sale_quantity}}</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">
									{{number_format($subtotal).' VNĐ'}}
								</p>
							</td>
							
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

@endsection
