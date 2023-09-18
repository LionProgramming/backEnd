<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsuariosTable extends Migration
{
    public function up():void
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->integer('documento')->primary();
            $table->date('fechaNacimiento');
            $table->string('nombre1', 255);
            $table->string('nombre2', 255)->nullable();
            $table->string('apellido1', 255);
            $table->string('apellido2', 255)->nullable();
            $table->string('email')->unique();
            $table->integer('telefono_fijo')->nullable();
            $table->integer('telefono_celular');
            $table->string('contrasenia', 255);
            $table->string('urlFoto', 50)->nullable();
            $table->integer('Tipo_idTipoDocumento');
            $table->integer('Rol_idRol');
            $table->integer('Estado');
        });
    }

    public function down()
    {
        Schema::dropIfExists('usuarios');
    }
}

