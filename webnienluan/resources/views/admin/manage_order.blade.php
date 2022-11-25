@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê đơn hàng
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
            <th>Mã đơn hàng</th>
            <th>Ngày đặt hàng</th>
            <th>Tình trạng</th>
            <th>Chi tiết</th>
          </tr>
        </thead>
        <tbody>
          @php
          $i = 0;
          @endphp
          @foreach($all_order as $key => $order)
          @php
          $i++;
          @endphp
          <tr>
            <td>{{$i}}</td>
            <td>{{$order->order_code}}</td>
            <td>{{$order->created_at}}</td>
            <td>@if($order->order_status==1)
                  Chưa xử lý
                @elseif($order->order_status==2)
                  Đã xử lý
                @else
                  Hủy đơn hàng
                @endif
            </td>
            <td>
              <a href="{{URL::to('/view-order/'.$order->order_code)}}" class="active" ui-toggle-class="">
                <i class="fa fa-eye text-success text-active"></i></a><br>
              
                
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
            {!!$all_order->render()!!}
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection