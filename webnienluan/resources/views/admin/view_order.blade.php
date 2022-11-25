@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Thông tin đăng nhập
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
            <th>Tên người dùng</th>
            <th>Tài khoản</th>
            <th>Số điện thoại</th>
          </tr>
        </thead>
        <tbody>
         
          <tr>
            <td>{{$order_by_code->customer_name}}</td>
            <td>{{$order_by_code->customer_user}}</td>
            <td>{{$order_by_code->customer_phone}}</td>
          </tr>
          
          
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

<br>

<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Thông tin vận chuyển
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
            <th>Tên người nhận</th>
            <th>Địa chỉ</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Phương thức thanh toán</th>
          </tr>
        </thead>
        <tbody>
         
          <tr>
            <td>{{$order_by_code->shipping_name}}</td>
            <td>{{$order_by_code->shipping_address}}</td>
            <td>{{$order_by_code->shipping_email}}</td>
            <td>{{$order_by_code->shipping_phone}}</td>
            <td>
              @if($order_by_code->shipping_method==1)
                Thanh toán bằng thẻ ATM
              @else
                Thanh toán khi nhận hàng
              @endif
            </td>
          </tr>
          
        </tbody>
      </table>
    </div>
  </div>
</div>

<br>

<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Chi tiết đơn hàng
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
            <th>Số lượng tồn</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Tổng tiền</th>
          </tr>
        </thead>
        <tbody>
          @php
          $total = 0;
          @endphp

          @foreach($order_detail as $key => $detail)

          @php
          $subtotal = $detail->product_price * $detail->product_sale_quantity;
          $total += $subtotal;
          $fee = 20000;
          @endphp

          <tr>
            <td>{{$detail->product_name}}</td>
            <td>{{$detail->product_quantity}}</td>
            <td>
              {{$detail->product_sale_quantity}}
              <input type="hidden" name="product_sale_quantity" value="{{$detail->product_sale_quantity}}">
              <input type="hidden" name="order_product_id" value="{{$detail->product_id}}">
            </td>
            <td>{{number_format($detail->product_price).' VNĐ'}}</td>
            <td>{{number_format($detail->product_price * $detail->product_sale_quantity).' VNĐ'}}</td>
          </tr>
          @endforeach
          <tr>
            <td colspan="12"></td>
          </tr>
          <tr>
            <td colspan="6" style="color: black;">Tổng: <a style="margin-left: 105px; color: red;">{{number_format($total).' VNĐ'}}</a></td>
          </tr>
          <tr>
            <td colspan="6" style="color: black;">Phí vận chuyển: <a style="margin-left: 42px; color: red;">{{number_format($fee).' VNĐ'}}</a></td>
          </tr>
          <tr>
            <td colspan="6" style="color: black;">Thanh toán: <a style="margin-left: 66px; color: red;">{{number_format($total + $fee).' VNĐ'}}</a></td>
          </tr>
          <tr>
            <td colspan="4">
              @foreach($order as $key => $or)
                @if($or->order_status == 1)
                <form>
                  @csrf
                  <select class="form-control order_detail">
                    <option value="">------Chọn hình thức đơn hàng-------</option>
                    <option id="{{$or->order_id}}" selected value="1">Chưa xử lý</option>
                    <option id="{{$or->order_id}}" value="2">Đã xử lý</option>
                    <option id="{{$or->order_id}}" value="3">Hủy đơn hàng</option>
                  </select>
                </form>
                @elseif($or->order_status == 2)
                <form>
                  @csrf
                  <p class="form-control order_detail">Đã xử lý</p>
                </form>
                @else
                <form>
                  @csrf
                  <p class="form-control order_detail">Hủy đơn hàng</p>
                </form>
                @endif
              @endforeach
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
@endsection