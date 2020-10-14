<?php

namespace App\Http\Controllers;

use App\Models\Pro_fac;
use App\Models\Facturas;
use App\Models\Productos;
use DB;
use Illuminate\Http\Request;

class FacturaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $factura = pro_fac :: select
        ('Fecha_Factura',DB::raw('SUM(Cantidad) AS cant' ),
        DB::raw('SUM(cantidad*Precio_Producto) AS Total'), 'ID_Factura') -> Join
        ('facturas', 'ID_Factura', '=', 'pro_fac.FK_ID_Factura') -> Join
        ('productos', 'ID_Producto', '=', 'pro_fac.FK_ID_Producto')
        ->groupBy ('ID_Factura')
        ->get();



        return view ('factura',compact('factura'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        return view ('Final', [
        'fac' => pro_fac :: select
        ('Fecha_Factura',DB::raw('sum(Cantidad*Precio_Producto) AS Total' ),
        DB::raw('SUM(Cantidad) AS cantidad' ),
       'Precio_Producto','Nombre_Producto') -> Join
        ('facturas', 'ID_Factura', '=', 'pro_fac.FK_ID_Factura') -> Join
        ('productos', 'ID_Producto', '=', 'pro_fac.FK_ID_Producto')
        ->where ('FK_ID_Factura','=',$id)
        -> groupby ('Nombre_Producto')
        ->get()
        ]);




    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
