@extends('welcome')
@section('content')

<div class="features_items"><!--features_items-->
                        @foreach($category_name as $key => $cate)
                        <h2 class="title text-center">{{$cate->category_name}}</h2>
                        @endforeach

                        @foreach($category_by_id as $key => $pro)
                        <a href="{{URL::to('/chi-tiet-san-pham/'.$pro->product_id)}}">
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                        <div class="productinfo text-center">
                                            <!-- <form action="{{URL::to('/save-cart')}}" method="POST">
                                                {{csrf_field()}}
                                            <input name="productid_hidden" type="hidden" value="{{$pro->product_id}}" />
                                            <input name="productname_hidden" type="hidden" value="{{$pro->product_name}}" />
                                            <input name="productimage_hidden" type="hidden" value="{{$pro->product_image}}" />
                                            <input name="productprice_hidden" type="hidden" value="{{$pro->product_price}}" />
                                            <input name="qty" type="hidden" min="1" value="1" /> -->

                                            <a href="{{URL::to('/chi-tiet-san-pham/'.$pro->product_id)}}">
                                                <img src="{{URL::to('public/uploads/product/'.$pro->product_image)}}" alt="" />
                                                <h2>{{number_format($pro->product_price).' VNĐ'}}</h2>
                                                <p>{{($pro->product_name)}}</p>
                                             
                                            </a>
                                            <i class="pro">Online giá rẻ</i>
                                            <!-- </form> -->
                                        </div>
                                </div>
                                
                            </div>
                        </div>
                        </a>
                        @endforeach
                    </div><!--features_items-->

@endsection