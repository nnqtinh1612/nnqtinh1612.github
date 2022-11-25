@extends('welcome')
@section('content')

@foreach($product_details as $key => $details)
<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="{{URL::to('/public/uploads/product/'.$details->product_image)}}" alt="" />
								
							</div>
							<div id="similar-product" class="carousel slide" data-ride="carousel">
								    
								  <!-- Controls -->
								  <a class="left item-control" href="#similar-product" data-slide="prev">
									<i class="fa fa-angle-left"></i>
								  </a>
								  <a class="right item-control" href="#similar-product" data-slide="next">
									<i class="fa fa-angle-right"></i>
								  </a>
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="images/product-details/new.jpg" class="newarrival" alt="" />
								<h2>{{$details->product_name}}</h2>
								<p>Mã sản phẩm: {{$details->product_id}}</p>
								<img src="images/product-details/rating.png" alt="" />

								<form action="{{URL::to('/save-cart')}}" method="POST">
									{{csrf_field()}}
								<span>
									<span>{{number_format($details->product_price).' VNĐ'}}</span>
									<label>Số lượng:</label>
									<input name="qty" type="number" min="1" max="{{$details->product_quantity}}" value="1" />
									<input name="productid_hidden" type="hidden" value="{{$details->product_id}}" />
									<input name="productqty_hidden" type="hidden" value="{{$details->product_quantity}}" />
									<button type="submit" class="btn btn-fefault cart" style="margin-bottom: 7px;">
										<i class="fa fa-shopping-cart" ></i>
										Thêm giỏ hàng
									</button>
								</span>
								</form>

								<p><b>Tình trạng:</b>
									@if($details->product_quantity != 0)
									Còn hàng
									@else
									Hết hàng
									@endif
								</p>
								<p><b>Thương hiệu:</b> {{$details->brand_name}}</p>
								<p><b>Danh mục:</b> {{$details->category_name}}</p>
								<a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
							</div><!--/product-information-->
						</div>
</div><!--/product-details-->


					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#details" data-toggle="tab">Mô tả</a></li>
								<li><a href="#companyprofile" data-toggle="tab">Chi tiết</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="details" >
								<p>{!!$details->product_desc!!}</p>
							</div>
							
							<div class="tab-pane fade" id="companyprofile" >
								<p>{!!$details->product_content!!}</p>
							</div>
							
							
							
							
						</div>
					</div><!--/category-tab-->
@endforeach


					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">Sản phẩm liên quan</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
								@foreach($relate as $key => $relate)
									<div class="col-sm-3">
										<div class="product-image-wrapper">
											<div class="single-products">
                                        		<div class="productinfo text-center">
                                            		<!-- <form action="{{URL::to('/save-cart')}}" method="POST">
                                               		{{csrf_field()}}
		                                            <input name="productid_hidden" type="hidden" value="{{$relate->product_id}}" />
		                                            <input name="productname_hidden" type="hidden" value="{{$relate->product_name}}" />
		                                            <input name="productimage_hidden" type="hidden" value="{{$relate->product_image}}" />
		                                            <input name="productqty_hidden" type="hidden" value="{{$relate->product_quantity}}" />
		                                            <input name="productprice_hidden" type="hidden" value="{{$relate->product_price}}" />
		                                            <input name="qty" type="hidden" min="1" value="1" /> -->

		                                            <a href="{{URL::to('/chi-tiet-san-pham/'.$relate->product_id)}}">
		                                                <img src="{{URL::to('public/uploads/product/'.$relate->product_image)}}" alt="" />
		                                                <h2>{{number_format($relate->product_price).' VNĐ'}}</h2>
		                                                <p>{{($relate->product_name)}}</p>
		                                             
		                                            </a>
		                                            <i class="pro">Online giá rẻ</i>
		                                            <!-- </form> -->
                                        		</div>
                               				 </div>
										</div>
									</div>	
								@endforeach				
								</div>	
								
							</div>
							 	
						</div>
					</div><!--/recommended_items-->
@endsection