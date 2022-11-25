@extends('welcome')
@section('content')
<br>

<div id="contact-page" class="container">
    	<div class="bg">
	    	<div class="row">    		
	    		<div class="col-sm-12">    			   			
					<h2 class="title text-center">Liên hệ với chúng tôi</h2>   				
				</div>
			</div>			 		
		</div>    	
    		<div class="row">  	
	    		<div class="col-sm-8 clearfix" style="border: 1px hidden; margin-left: -80px;">
						<div class="bill-to">
							<p style="margin-left: 420px;">Điền thông tin </p>
							<div class="form-one">
								<form action="{{URL::to('/save-lien-he')}}" method="POST">
									{{csrf_field()}}
									<input type="text" name="contact_name" placeholder="Họ và tên" required="">
									<input type="email" name="contact_email" placeholder="Email" required="">
									<input type="text" name="contact_phone" placeholder="Số điện thoại" required="">
									<textarea name="contact_desc" placeholder="Mô tả vấn đề" rows="10" required=""></textarea>
									<input type="submit" value="Gửi" name="send_order" class="btn btn-primary btn-sm" style="margin-top: 20px">
								</form>
							</div>
							
						</div>
					</div>
	    		<div class="col-sm-4" style="margin-left:-40px">
	    			<div class="contact-info">
	    				<h3 class="title text-left" style="color: #696763; font-size: 20px;">Thông tin liên hệ của cửa hàng</h3>
	    				<address>
	    					<p style="color: black;"><strong>Mobile-Store Inc.</strong></p>
							<p style="color: black;"><strong>Ninh Kieu, TP. Cần Thơ, Việt Nam</strong></p>
							<p style="color: black;"><strong>Mobile:</strong> +84 911911333</p>
							<p style="color: black;"><strong>Email:</strong> mobilestore@gmail.com</p>
	    				</address>
	    				<div class="social-networks">
	    					<h3 class="title text-center" style="color: #696763; font-size: 20px;">Các trang mạng xã hội của cửa hàng</h3>
							<ul>
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-google-plus"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-youtube"></i></a>
								</li>
							</ul>
	    				</div>
	    			</div>
    			</div>    			
	    	</div>  
    	</div>	
    </div><!--/#contact-page-->

@endsection