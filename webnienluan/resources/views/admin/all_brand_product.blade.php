@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê thương hiệu sản phẩm
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
            <th>Thứ tự</th>
            <th>Tên thương hiệu</th>
            <th>Hiển thị</th>
            <th style="width:30px;">Sửa/Xóa</th>
          </tr>
        </thead>
        <tbody>
          @php
          $i = 0;
          @endphp
          @foreach($all_brand_product as $key => $brand_pro)
          @php
          $i++;
          @endphp
          <tr>
            <td>{{$i}}</td>
            <td>{{$brand_pro->brand_name}}</td>
            <td><span class="text-ellipsis">
              <?php
                if($brand_pro->brand_status == 0){
              ?>
                <a href = "{{URL::to('/unactive-brand-product/'.$brand_pro->brand_id)}}"><span class="fa fa-check-square-o"></span></a>
              <?php
                  
                }else{
              ?>
                <a href = "{{URL::to('/active-brand-product/'.$brand_pro->brand_id)}}"><span class="fa fa-square-o"></span></a>
              <?php
                }
              ?>
            </span></td>
            <td>
              <a href="{{URL::to('/edit-brand-product/'.$brand_pro->brand_id)}}" class="active" ui-toggle-class="">
                <i class="fa fa-pencil-square-o text-success text-active"></i></a><br>
              <a onclick="return confirm('Bạn có chắc muốn xóa thương hiệu này không?')" href="{{URL::to('/delete-brand-product/'.$brand_pro->brand_id)}}" class="active" ui-toggle-class="">
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
            {!!$all_brand_product->render()!!}
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection