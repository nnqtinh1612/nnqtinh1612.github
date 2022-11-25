@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê danh mục sản phẩm
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
            <th>Tên danh mục</th>
            <th>Hiển thị</th>
            <th style="width:30px;">Sửa/Xóa</th>
          </tr>
        </thead>
        <tbody>
          @php
          $i = 0;
          @endphp
          @foreach($all_category_product as $key => $cate_pro)
          @php
          $i++;
          @endphp
          <tr>
            <td>{{$i}}</td>
            <td>{{$cate_pro->category_name}}</td>
            <td><span class="text-ellipsis">
              <?php
                if($cate_pro->category_status == 0){
              ?>
                <a href = "{{URL::to('/unactive-category-product/'.$cate_pro->category_id)}}"><span class="fa fa-check-square-o"></span></a>
              <?php
                  
                }else{
              ?>
                <a href = "{{URL::to('/active-category-product/'.$cate_pro->category_id)}}"><span class="fa fa-square-o"></span></a>
              <?php
                }
              ?>
            </span></td>
            <td>
              <a href="{{URL::to('/edit-category-product/'.$cate_pro->category_id)}}" class="active" ui-toggle-class="">
                <i class="fa fa-pencil-square-o text-success text-active"></i></a><br>
              <a onclick="return confirm('Bạn có chắc muốn xóa danh mục này không?')" href="{{URL::to('/delete-category-product/'.$cate_pro->category_id)}}" class="active" ui-toggle-class="">
                <i class="fa fa-times text-danger text"></i></a>
            </td>
          </tr>
          @endforeach
          
          </tr>
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
            {!!$all_category_product->render()!!}
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection