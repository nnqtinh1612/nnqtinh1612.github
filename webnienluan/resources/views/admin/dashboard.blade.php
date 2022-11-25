@extends('admin_layout')
@section('admin_content')
	<div class="heading">
      <p class="head">Chào mừng đến với trang Admin</p>
      <p>Tổng quan</p>
      <br>
    <div class="heading1">
    	<div>
	      <img src="{{asset('public/backend/images/dt.png')}}" style="width:30%">
	    </div>
	    <div class="head2">
	    	<p style="font-size:55px; color: #0d1137;"><a style="color: #e52165;">E</a>-STORE</p>
	    	<ul style="list-style-type:square">
	    		<li>Cửa hàng E-Store bán tất cả các thiết bị điện tử.</li>
	    		<li>Đảm bảo uy tín, chất lượng.</li>
	    		<li>Phục vụ thân thiện, nhiệt tình.</li>
	    		<li>Giao hàng tận nơi, nhanh chóng.</li>
	    	</ul>
	    </div>
    </div>
    </div>

    <br>

    <div class="heading">

			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-list"> </i>
					</div>
					<div class="col-md-8 market-update-left">
					<h4>Sản phẩm</h4>
					@php
			        $i = 0;
			        @endphp
					@foreach($all_pro as $pro)
					@php
          			$i++;
          			@endphp	
					@endforeach
					<h3>{{$i}}</h3>
				  </div>
				  <div class="clearfix"> </div>
				</div>
			</div>

			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-users" ></i>
					</div>
					<div class="col-md-8 market-update-left">
					<h4>Khách hàng</h4>
					@php
			        $a = 0;
			        @endphp
					@foreach($all_cus as $cus)
					@php
          			$a++;
          			@endphp	
					@endforeach
						<h3>{{$a}}</h3>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>

			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-3">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-envelope-o"></i>
					</div>
					<div class="col-md-8 market-update-left">
					<h4>Liên hệ</h4>
					@php
			        $b = 0;
			        @endphp
					@foreach($all_cont as $cont)
					@php
          			$b++;
          			@endphp	
					@endforeach
						<h3>{{$b}}</h3>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>

			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-4">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>
					</div>
					<div class="col-md-8 market-update-left">
					<h4>Đơn hàng</h4>
					@php
			        $c = 0;
			        @endphp
					@foreach($all_or as $or)
					@php
          			$c++;
          			@endphp	
					@endforeach
						<h3>{{$c}}</h3>	
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
    </div>
@endsection