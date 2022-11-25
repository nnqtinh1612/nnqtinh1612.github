@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê tài khoản thành viên
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
            <th>Họ và tên</th>
            <th>Tên người dùng</th>
            <th>Mật khẩu</th>
            <th>Số điện thoại</th>
            <th>Ngày đăng ký</th>
            <th>Tùy chỉnh</th>
          </tr>
        </thead>
        <tbody>
          @foreach($all_customer as $key => $customer)
          <tr>
            <td>{{$customer->customer_name}}</td>
            <td>{{$customer->customer_user}}</td>
            <td>*********</td>
            <td>{{$customer->customer_phone}}</td>
            <td>{{$customer->created_at}}</td>
            <td>
                <a href="{{URL::to('/customer-order/'.$customer->customer_id)}}" class="active" ui-toggle-class="">
                <i class="fa fa-list-alt text-success text-active"></i></a><br>
                <a onclick="return confirm('Bạn có chắc muốn xóa tài khoản thành viên này không?')" href="{{URL::to('/delete-customer/'.$customer->customer_id)}}" class="active" ui-toggle-class="">
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
            {!!$all_customer->render()!!}
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection