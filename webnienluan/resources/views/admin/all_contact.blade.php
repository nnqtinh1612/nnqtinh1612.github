@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê những liên hệ từ khách hàng
    </div>
    
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Thứ tự</th>
            <th>Tên khách hàng</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Mô tả</th>
            <th>Thời gian</th>
          </tr>
        </thead>
        <tbody>
          @php
          $i = 0;
          @endphp
          @foreach($all_contact as $key => $contact)
          @php
          $i++;
          @endphp
          <tr>
            <td>{{$i}}</td>
            <td>{{$contact->contact_name}}</td>
            <td>{{$contact->contact_email}}</td>
            <td>{{$contact->contact_phone}}</td>
            <td>{{$contact->contact_desc}}</td>
            <td>{{$contact->created_at}}</td>
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
            {!!$all_contact->render()!!}
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection