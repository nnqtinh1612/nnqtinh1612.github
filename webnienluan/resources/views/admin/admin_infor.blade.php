@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Thông tin user
                            
                        </header>

                        <div class="panel-body">
                            <div class="position-center">
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Họ và tên: </label>
                                    <a class="infor1">
                                      <?php
                                          $name = Auth::user()->admin_name;
                                          if($name){
                                            echo $name;
                                          }
                                        ?>       
                                    </a>
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email: </label>
                                    <a class="infor2">
                                      <?php
                                          $name = Auth::user()->admin_email;
                                          if($name){
                                            echo $name;
                                          }
                                        ?>       
                                    </a>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Mật Khẩu: </label>
                                    <a class="infor3">
                                      *******    
                                    </a>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Số điện thoại: </label>
                                    <a class="infor4">
                                      <?php
                                          $name = Auth::user()->admin_phone;
                                          if($name){
                                            echo $name;
                                          }
                                        ?>       
                                    </a>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Quyền: </label>
                                    @foreach($admin_infor as $infor)
                                    <a class="infor5">
                                      {{'■ '.($infor->name)}}
                                    </a>
                                    @endforeach
                                </div> 
                            
                           
                            </div>

                        </div>
                    </section>

            </div>
@endsection