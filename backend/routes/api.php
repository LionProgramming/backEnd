<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UsuarioController;

#grupo rutas Admin CRUD
Route::controller(UsuarioController::class)->group(function(){
    Route::get('/usuarios', 'index');
    Route::post('/createusuarios','store');
    Route::get('/usuarios/{id}','show');
    Route::post('/usuarios/{id}', 'update');
    Route::delete('/usuarios/deleteusuario/{id}', 'destroy');
});

Route::get('/dashboard/admin', 'AdminController@index')->middleware(['auth', 'admin']);
Route::get('/dashboard/user', 'UserController@index')->middleware(['auth', 'usuario']);
Route::get('/dashboard/user', 'UserController@index')->middleware(['auth', 'profesor']);


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
