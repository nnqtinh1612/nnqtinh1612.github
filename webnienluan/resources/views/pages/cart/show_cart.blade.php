@extends('welcome')
@section('content')

<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="{{URL::to('/')}}">Trang chủ</a></li>
				  <li class="active">Giỏ hàng</li>
				  <?php
			          $message = Session::get('message');
			          if($message){
			            echo '<span class="text-alert">',$message,'</span>';
			            Session::put('message',null);
			          }
			        ?>
				</ol>
			</div>
			<div class="table-responsive cart_info" style="border:1px hidden;">
				<?php
					$content = Cart::content();
				?>
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
						@foreach($content as $v_content)
						<tr>
							<td class="cart_product">
								<a href=""><img src="{{URL::to('public/uploads/product/'.$v_content->options->image)}}" width="60px" alt="" /></a>
							</td>
							<td class="cart_description">
								<h4><a href="">{{$v_content->name}}</a></h4>
							</td>
							<td class="cart_price">
								<p>{{number_format($v_content->price).' VNĐ'}}</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<form action="{{URL::to('/update-cart-quantity')}}" method="POST">
										{{csrf_field()}}
									<input class="cart_quantity_input" type="number" min="1" max="{{$v_content->weight}}"  name="cart_quantity" value="{{$v_content->qty}}">
									<input type="hidden" value="{{$v_content->rowId}}" name="rowId_cart">
									<input type="submit" value="Cập nhật" name="uapdate_qty" class="btn btn-default btn-sm">
									</form>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">
									<?php
										$subtotal = $v_content->price * $v_content->qty;
										echo number_format($subtotal).' VNĐ';
									?>
								</p>
							</td>
							<td class="cart_delete" style="margin-right: 5px;">
								<a class="cart_quantity_delete" href="{{URL::to('/delete-to-cart/'.$v_content->rowId)}}"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="row">
				<div class="col-sm-6" style="margin-left: 40px">
					<div class="total_area" style="border:1px hidden;">
						@php
				          $total = 0;
				          $cart_count = Cart::count();
				        @endphp
				        
				        @foreach($content as $val)

				        @php
				          $subtotal = $val->price * $val->qty;          
				          $total += $subtotal;
				        @endphp
				        @endforeach

				        @if($cart_count != 0)
				        <ul>
							<li>Tổng <span>{{number_format($total).' VNĐ'}}</span></li>
							<li>Phí vận chuyển <span>{{number_format(20000).' VNĐ'}}</span></li>
							<li>Thành tiền <span>{{number_format($total + 20000).' VNĐ'}}</span></li>
						</ul>
				        @else
				        <ul>
							<li>Tổng <span>{{number_format($total).' VNĐ'}}</span></li>
							<li>Phí vận chuyển <span>{{number_format(0).' VNĐ'}}</span></li>
							<li>Thành tiền <span>{{number_format($total + 0).' VNĐ'}}</span></li>
						</ul>
				        @endif

                        <a class="btn btn-default check_out" href="{{URL::to('/checkout')}}">Thanh toán</a>
							
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->

@endsection
