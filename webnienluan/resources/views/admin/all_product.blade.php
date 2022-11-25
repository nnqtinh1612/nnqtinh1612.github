@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê sản phẩm
    </div>
    
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <?php
          $message = Session::get('message');
          if($message){
            echo '<span class="text-alert">',$message,'</span>';
            Session::put('message',null);
          }
        ?>
        <thead>
          <tr>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Hình ảnh</th>
            <th>Danh mục</th>
            <th>Thương hiệu</th>
            <th>Hiển thị</th>
            <th style="width:30px;">Sửa/Xóa</th>
          </tr>
        </thead>
        <tbody>
          @foreach($all_product as $key => $pro)
          <tr>
            <td>{{$pro->product_name}}</td>
            <td>{{$pro->product_quantity}}</td>
            <td>{{$pro->product_price}}</td>
            <td><img src ="public/uploads/product/{{$pro->product_image}}" height="100" width="100"></td>
            <td>{{$pro->category_name}}</td>
            <td>{{$pro->brand_name}}</td>
            <td><span class="text-ellipsis">
              <?php
                if($pro->product_status == 0){
              ?>
                <a href = "{{URL::to('/unactive-product/'.$pro->product_id)}}"><span class="fa fa-check-square-o"></span></a>
              <?php
                  
                }else{
              ?>
                <a href = "{{URL::to('/active-product/'.$pro->product_id)}}"><span class="fa fa-square-o"></span></a>
              <?php
                }
              ?>
            </span></td>
            <td>
              <a href="{{URL::to('/edit-product/'.$pro->product_id)}}" class="active" ui-toggle-class="">
                <i class="fa fa-pencil-square-o text-success text-active"></i></a><br>
              <a onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?')" href="{{URL::to('/delete-product/'.$pro->product_id)}}" class="active" ui-toggle-class="">
                <i class="fa fa-times text-danger text"></i></a>
            </td>
          </tr>
          @endforeach
      
        </tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">
        
        <div class="col-sm-5 text-center">
          <small class="text-muted inline m-t-sm m-b-sm"></small>
        </div>
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            {!!$all_product->render()!!}
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection