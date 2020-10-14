<?php



Route :: get ('/','App\Http\Controllers\FacturaController@index')->name('factura.index');
Route :: get ('factura/{ID_Factura} ','App\Http\Controllers\FacturaController@show')->name('factura.show');

