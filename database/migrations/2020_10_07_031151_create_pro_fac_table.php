<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProFacTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pro_fac', function (Blueprint $table) {
            $table->increments ('ID_Pro_Fac');
            $table -> string('FK_ID_Factura');
            $table -> string('FK_ID_Producto');
            $table -> integer('Cantidad');
            $table->timestamps();

            $table -> foreign('FK_ID_Factura') ->references('ID_Factura')->on('facturas');
            $table -> foreign('FK_ID_Producto') ->references('ID_Producto')->on('productos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pro_fac');
    }
}
