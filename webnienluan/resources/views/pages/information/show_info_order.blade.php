@extends('welcome')
@section('content')

<section id="cart_items">
		<div class="container">
			<h2 class="title text-center">Thông tin</h2>
			@foreach($customer_info as $info)
			<p class="info_cus">Họ và tên:<a class="info1">{{$info->customer_name}}</a></p>
			<p class="info_cus">Tên người dùng:<a class="info2">{{$info->customer_user}}</a></p>
			<p class="info_cus">Mật khẩu:<a class="info3">********</a></p>
			<p class="info_cus">Số điện thoại:<a class="info4">{{$info->customer_phone}}</a></p>
			<p class="info_cus">Ngầy đăng ký:<a class="info5">{{$info->created_at}}</a></p>
			<div class="table-responsive cart_info" style="border:1px hidden;">
			@endforeach
			<br>
				<table class="table table-condensed" style="margin-bottom:100px;">
					<thead>
						<tr class="cart_menu">
							<td>Mã đơn hàng</td>
							<td>Tổng tiền</td>
							<td>Phí vận chuyển</td>
							<td>Trạng thái</td>
							<td>Ngày đặt</td>
							<td>Chi tiết</td>
						</tr>
					</thead>
					<tbody>
						@php
							$ship = 20000;
						@endphp
						@foreach($customer as $val)
						<tr>
							<td class="style_order">{{$val->order_code}}</td>
							<td class="style_order">{{($val->order_total).' VNĐ'}}</td>
							<td class="style_order">{{number_format($ship).' VNĐ'}}</td>
							<td class="style_order">
								@if($val->order_status==1)
				                  Chưa xử lý
				                @elseif($val->order_status==2)
				                  Đã xử lý
				                @else
				                  Đã hủy
				                @endif
							</td>
							<td class="style_order">{{$val->created_at}}</td>
							<td class="style_order"><a href="{{URL::to('/show-order-detail/'.$val->order_code)}}"><i class="fa fa-eye" style="color: green;"></i></a></td>
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

@endsection
