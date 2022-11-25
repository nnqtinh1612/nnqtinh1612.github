@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Đơn hàng của thành viên
    </div>
    
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Thứ tự</th>
            <th>Mã đơn hàng</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Ngày đặt</th>
          </tr>
        </thead>
        <tbody>
          @php
          $i = 0;
          @endphp
          @foreach($customer_order as $key => $cus_or)
          @php
          $i++;
          @endphp
          <tr>
            <td>{{$i}}</td>
            <td>{{$cus_or->order_code}}</td>
            <td>{{$cus_or->order_total}}</td>
            <td>
              @if($cus_or->order_status==1)
                  Chưa xử lý
                @elseif($cus_or->order_status==2)
                  Đã xử lý
                @else
                  Hủy đơn hàng
                @endif
            </td>
            <td>{{$cus_or->created_at}}</td>
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
            {!!$customer_order->render()!!}
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection