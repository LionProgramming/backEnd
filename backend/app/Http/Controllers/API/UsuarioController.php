<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Carbon;

use App\Models\Usuario;

class UsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
{
    $usuarios = Usuario::join('Roles', 'Usuarios.Rol_idRol', '=', 'Roles.idRol')
        ->join('TiposDocumentos', 'Usuarios.Tipo_idTipoDocumento', '=', 'TiposDocumentos.idTipoDocumento')
        ->select('Usuarios.documento', 'TiposDocumentos.tipoDocumento AS tipo_documento', 'Usuarios.fechaNacimiento', 'Usuarios.nombre1','Usuarios.nombre2', 'Usuarios.apellido1','Usuarios.apellido2','Usuarios.email', 'Usuarios.telefono_celular','telefono_fijo', 'Usuarios.contrasenia', 'Roles.rol AS Rol')
        ->get();

    // Formatear la fecha de nacimiento
    foreach ($usuarios as $usuario) {
        $usuario->fechaNacimiento = date('Y-m-d', strtotime($usuario->fechaNacimiento));
    }

    return response()->json($usuarios);
}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
                $request -> validate([
                'documento' => 'required|integer',
                'fechaNacimiento' => 'date',
                'nombre1' => 'required|string|max:255',
                'nombre2' => 'nullable|string|max:255',
                'apellido1' => 'required|string|max:255',
                'apellido2' => 'nullable|string|max:255',
                'email' => 'required|email|unique:usuarios,email',
                'telefono_fijo' => 'nullable|integer',
                'telefono_celular' => 'required|integer',
                'contrasenia' => 'required|string|max:30',
                'urlFoto' => 'nullable|string|max:50',
                'Tipo_idTipoDocumento' => 'required|integer',
                'Rol_idRol' => 'required|integer',
                'Estado' => 'required|integer',
              ]);
              // Crea un nuevo usuario utilizando los datos JSON
            $usuario = new Usuario;
            $usuario->documento = $request->documento;
            $usuario->fechaNacimiento = $request->fechaNacimiento;
            $usuario->nombre1 = $request->nombre1;
            $usuario->nombre2 = $request->nombre2;
            $usuario->apellido1 = $request->apellido1;
            $usuario->apellido2 = $request->apellido2;
            $usuario->email = $request->email;
            $usuario->telefono_fijo = $request->telefono_fijo;
            $usuario->telefono_celular = $request->telefono_celular;
            $usuario->contrasenia = $request->contrasenia; 
            $usuario->urlFoto = $request->urlFoto;
            $usuario->Tipo_idTipoDocumento = $request->Tipo_idTipoDocumento;
            $usuario->Rol_idRol = $request->Rol_idRol;
            $usuario->Estado = $request->Estado;
            $usuario->save();
            // Retorna una respuesta JSON con el nuevo usuario creado y un código de respuesta 201 (creado)
            return response()->json($usuario, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $documento)
    {
        $usuario = Usuario::join('Roles', 'Usuarios.Rol_idRol', '=', 'Roles.idRol')
        ->join('TiposDocumentos', 'Usuarios.Tipo_idTipoDocumento', '=', 'TiposDocumentos.idTipoDocumento')
        ->select(
            'Usuarios.documento',
            'TiposDocumentos.tipoDocumento AS tipo_documento',
            'Usuarios.fechaNacimiento',
            'Usuarios.nombre1',
            'Usuarios.nombre2',
            'Usuarios.apellido1',
            'Usuarios.apellido2',
            'Usuarios.email',
            'Usuarios.telefono_celular',
            'Usuarios.contrasenia',
            'Roles.rol AS Rol'
        )
        ->where('Usuarios.documento', '=', $documento)
        ->first();
        return $usuario;

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $documento)
    {
        $usuario= Usuario::where('documento',$documento)->firstOrFail();
        $usuario->fill($request->except('documento'));
        $usuario->save();

        return response()->json($usuario);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $documento)
    {
            // Encuentra al usuario por el documento y elimínalo
            $usuario = Usuario::where('documento', $documento)->first();
    
            if ($usuario) {
                $usuario->delete();
                return 'Se ha eliminado la persona ' . $usuario->nombre;
            } else {
                return 'No se encontró la persona con el documento ' . $documento;
            }
    }
    
}
