<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    // ...

    protected function authenticated(Request $request, $user)
    {
        if ($user->hasRole('administrador')) {
            return redirect('/dashboard/admin');
        } elseif ($user->hasRole('user')) {
            return redirect('/dashboard/user');
        } else{
            return redirect('/dashboard/profesor');
        }

        // En caso de que no se ajuste a ningún rol específico, puedes redirigir a una página predeterminada.
        return redirect('/dashboard/default');
    }
}

