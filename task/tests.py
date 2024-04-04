from django.test import TestCase

from .models import Usuarios,Roles
# Create your tests here.


class UsuariosTestCase(TestCase):
    def test_crear_usuario(self):
        rol_id=1
        rol=Roles.objects.get(idrol=rol_id)
        usuario=Usuarios.objects.create(
            documento=1234567890,
            fechanacimiento="2000-01-01",
            nombre1="Nombre1",
            apellido1="Apellido1",
            email="correo@ejemplo.com",
            telefono_fijo=1234567,
            telefono_celular=987654321,
            contrasenia="contraseña123",
            urlfoto="http://url-de-la-foto.com",
            tipo_idtipoDocumento=1,
            rol_idrol=rol,
            estado=1,
            
        )
        self.assertEqual(usuario.documento, 1234567890)
        self.assertEqual(str(usuario.fechanacimiento), "2000-01-01")
        self.assertEqual(usuario.nombre1, "Nombre1")
        self.assertEqual(usuario.apellido1, "Apellido1")
        self.assertEqual(usuario.email, "correo@ejemplo.com")
        self.assertEqual(usuario.telefono_fijo, 1234567)
        self.assertEqual(usuario.telefono_celular, 987654321)
        self.assertEqual(usuario.contrasenia, "contraseña123")
        self.assertEqual(usuario.urlfoto, "http://url-de-la-foto.com")
        self.assertEqual(usuario.tipo_idtipodocumento, 1)
        self.assertEqual(usuario.rol_idrol, 1)
        self.assertEqual(usuario.estado, 1)
   