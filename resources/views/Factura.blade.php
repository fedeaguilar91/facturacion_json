@extends('layout')

@section('content')
    <h1>FACTURAS<h1>

        <table class="table"  border="1">
            <thead>
                <tr>
                    <th>Fecha_Factura  </th>
                    <th>Cantidad </th>
                    <th>Precio Total  </th>
                    <th>Ver Factura</th>

                </tr>
            </thead>
            <tbody>
                @foreach($factura as $facturas)
                    <tr>
                        <td>{!! $facturas->Fecha_Factura !!}</td>
                        <td>{!! $facturas->cant !!}</td>
                        <td>{!! $facturas->Total !!}</td>
                         <td> <a href=" {{ route ('factura.show', $facturas->ID_Factura) }} "> Ver</a></td>


                    </tr>
                @endforeach
            </tbody>
        </table>

@endsection
