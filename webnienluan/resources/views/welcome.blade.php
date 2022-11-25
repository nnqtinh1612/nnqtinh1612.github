<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Trang chủ | E-Store</title>
    <link href="{{asset('public/frontend/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/prettyPhoto.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/price-range.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/animate.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/main.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/responsive.css')}}" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="{{('public/frontend/images/ico/favicon.ico')}}">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
    <header id="header"><!--header-->
        <div class="header_top"><!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="contactinfo">
                            <ul class="nav nav-pills">
                                <li><a href="#"><i class="fa fa-phone"></i> +84 911911333</a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i> estore@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="social-icons pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header_top-->
        
        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="logo pull-left">
                            <a style="font-size: 20px;"><span style="color: #e52165">E</span><span style="color: #0d1137">-STORE</span></a>
                        </div>
                        
                    </div>
                    <div class="col-sm-8">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <?php
                                    $customer_id = Session::get('customer_id');
                                    if($customer_id != NULL){
                                ?>
                                <li><a href="{{URL::to('/lien-he')}}"><i class="fa fa-phone-square"></i>Liên hệ</a></li>
                                <?php
                                }else{
                                ?>
                                <li><a href="{{URL::to('/login-checkout')}}"><i class="fa fa-phone-square"></i>Liên hệ</a></li>
                                <?php
                                }
                                ?> 
                                

                                <?php
                                    $customer_id = Session::get('customer_id');
                                    if($customer_id != NULL){
                                ?>
                                <li><a href="{{URL::to('/show-cart')}}"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
                                <?php
                                }else{
                                ?>
                                <li><a href="{{URL::to('/login-checkout')}}"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
                                <?php
                                }
                                ?> 


                                <?php
                                    $customer_id = Session::get('customer_id');
                                    if($customer_id != NULL){
                                ?>
                                <li class="dropdown">
                                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                        <i class="fa fa-user"></i>
                                        <span class="username">
                                            <?php
                                                $name = Session::get('customer_name');
                                                if($name){
                                                    echo $name;
                                                }
                                            ?>
                                        </span>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu extended logout" style="min-width: 120px;margin-top: 5px;">
                                        <li><a href="{{URL::to('/show-info-order')}}"><i class="fa fa-list-alt"></i> Thông tin</a>
                                        <li><a href="{{URL::to('/logout-checkout')}}"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
                                    </ul>
                                </li>
                                <?php
                                }else{
                                ?>
                                <li class="dropdown">
                                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                        <i class="fa fa-user"></i>
                                        <span class="username">
                                            Tài khoản
                                        </span>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu extended logout" style="min-width: 120px;margin-top: 5px;">
                                        <li><a href="{{URL::to('/login-checkout')}}"><i class="fa fa-sign-in"></i> Đăng nhập</a></li>
                                        <li><a href="{{URL::to('/register-checkout')}}"><i class="fa fa-plus-square"></i> Đăng ký</a></li>
                                    </ul>
                                </li>
                                
                                <?php
                                }
                                ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-middle-->
    
        
    
    <section id="slider"><!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>
                        
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-STORE</h1>
                                    <h2>Cửa hàng điện máy</h2>
                                    <p>Hân hạnh đươc phục vụ quý khách !!</p>
                                </div>
                                <div class="col-sm-6">
                                    <img src="{{asset('public/frontend/images/title4.png')}}" class="girl img-responsive" alt="" />
                        
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-STORE</h1>
                                    <h2>Chính hãng 100%</h2>
                                    <p>Hân hạnh đươc phục vụ quý khách !!</p>
                                </div>
                                <div class="col-sm-6">
                                    <img src="{{asset('public/frontend/images/title5.png')}}" class="girl img-responsive" alt="" />
                                    
                                </div>
                            </div>
                            
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-STORE</h1>
                                    <h2>Đảm bảo uy tín và chất lượng</h2>
                                    <p>Hân hạnh đươc phục vụ quý khách !!</p>
                                </div>
                                <div class="col-sm-6">
                                    <img src="{{asset('public/frontend/images/title3.png')}}" class="girl img-responsive" alt="" />
                                    
                                </div>
                            </div>
                            
                        </div>
                        
                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                    
                </div>
            </div>
        </div>

        <div class="header-bottom"><!--header-bottom-->
            <div class="row" style="background-color: #5b5b3e;">
            <div class="container">          
                    <div class="col-sm-7">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="{{URL::to('/trangchu')}}" class="active">Trang chủ</a></li>
                                <li class="dropdown"><a href="#">Sản phẩm<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        @foreach($category as $key => $cate)
                                            <li><a class="panel-title"><a href="{{URL::to('/danh-muc-san-pham/'.$cate->category_id)}}">{{$cate->category_name}}</a></li>
                                                
                                        @endforeach
                                    </ul>
                                </li> 
                                <li class="dropdown"><a href="#">Hãng<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        @foreach($brand as $key => $brand)
                                            <li><a class="panel-title"><a href="{{URL::to('/thuong-hieu-san-pham/'.$brand->brand_id)}}">{{$brand->brand_name}}</a></li>
                                                
                                        @endforeach
                                    </ul>
                                </li> 
                                <li><a href="{{URL::to('/tin-tuc')}}" class="active">Tin tức</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-5" style="margin-top:2.5px;">
                        <form action="{{URL::to('/tim-kiem')}}" method="POST">
                            {{csrf_field()}}
                        <div class="search_box pull-right" style="border:1px solid; border-radius:30px; border-color: white; background: white; margin-bottom: 3px;">
                            <input type="text" style="border:1px solid; border-radius: 30px; border-color: white;" name="keywords_submit" placeholder="Tìm kiếm sản phẩm">
                            <input type="submit" style="margin-top: 0px; color:#000; border-radius: 30px;" name="search_item" class="btn btn-primary btn-sm" value="Tìm kiếm">
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header><!--/header-->
    </section><!--/slider-->
    
    <section>
        <div class="container">
            <div class="row">
                
                <div class="col-sm-13 padding-right">
                    
                    @yield('content')
                    
                </div>
            </div>
        </div>
    </section>
    
    <footer id="footer"><!--Footer-->
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="companyinfo">
                            <h2><span>e</span>-store</h2>
                            <p style="font-size:18px">Hân hạnh được phục vụ quý khách !!</p>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="col-sm-4">
                            <div class="single-widget">
                                <h2>Dịch vụ</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Hỗ trợ trực tuyến</a></li>
                                    <li><a href="#">Liên hệ</a></li>
                                    <li><a href="#">Tình trạng đơn hàng</a></li>
                                    <li><a href="#">Thay đổi địa chỉ</a></li>
                                    <li><a href="#">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="single-widget">
                                <h2>Chính sách</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Điều khoản mua hàng</a></li>
                                    <li><a href="#">Chính sách bảo hành</a></li>
                                    <li><a href="#">Chính sách bảo mật</a></li>
                                    <li><a href="#">Chính sách hoàn trả</a></li>
                                    <li><a href="#">Hệ thống thanh toán</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Thông tin cửa hàng</a></li>
                                    <li><a href="#">Tuyển dụng</a></li>
                                    <li><a href="#">Địa chỉ cửa hàng</a></li>
                                    <li><a href="#">Liên hệ hợp tác kinh doanh</a></li>
                                    <li><a href="#">Ưu đãi từ đối tác</a></li>
                                </ul>
                            </div>
                        </div>
                        
                        
                        
                        
                    </div>
                    <div class="col-sm-3">
                        <div class="address">
                            <img src="{{asset('public/frontend/images/map.png')}}" alt="" />
                            <p>Ninh Kiều, TP. Cần Thơ</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
    </footer><!--/Footer-->
    

  
    <script src="{{asset('public/frontend/js/jquery.js')}}"></script>
    <script src="{{asset('public/frontend/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('public/frontend/js/jquery.scrollUp.min.js')}}"></script>
    <script src="{{asset('public/frontend/js/price-range.js')}}"></script>
    <script src="{{asset('public/frontend/js/jquery.prettyPhoto.js')}}"></script>
    <script src="{{asset('public/frontend/js/main.js')}}"></script>

</body>
</html>