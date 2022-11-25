@extends('welcome')
@section('content')

<section id="cart_items">
		<div class="container" style="width:100%">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="{{URL::to('/')}}">Trang chủ</a></li>
				  <li class="active">Thanh toán giỏ hàng</li>
				</ol>
			</div>

			<div class="register-req">
				<p>Vui lòng đăng ký hoặc đăng nhập để thanh toán giỏ hàng và xem lịch sử mua hàng.</p>
			</div><!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
					
					<div class="col-sm-12 clearfix" style="border: 1px hidden;">
						<div class="bill-to">
							<p>Điền thông tin gửi hàng</p>
							<div class="form-one">
								<form action="{{URL::to('/save-checkout-customer')}}" method="POST">
									{{csrf_field()}}
									<input type="text" name="shipping_name" placeholder="Họ và tên" required="">
									<input type="email" name="shipping_email" placeholder="Email" required="">
									<input type="text" name="shipping_address" placeholder="Địa chỉ" required="">
									<input type="text" name="shipping_phone" placeholder="Số điện thoại" required="">
									<textarea name="shipping_note" placeholder="Ghi chú đơn hàng của bạn" rows="10"></textarea>
									<h4 style="margin: 40px 0px; font-size: 20px;">Chọn hình thức thanh toán</h4>
									<div class="payment-options"required>
										<span>
											<label><input name="shipping_method" value="1" type="checkbox"> Thanh toán bằng thẻ tín dụng</label>
										</span>
										<span>
											<label><input name="shipping_method" value="2" type="checkbox"> Thanh toán khi nhận hàng</label>
										</span>
									</div>
									<input type="submit" value="Gửi" name="send_order" class="btn btn-primary btn-sm">
								</form>
							</div>
							
						</div>
					</div>
									
				</div>
			</div>

		</div>
	</section> <!--/#cart_items-->

@endsection