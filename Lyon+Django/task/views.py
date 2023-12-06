from rest_framework import viewsets,filters
from rest_framework.response import Response
from .serializer import UserSerializer,HorariosSerializer,GradosSerializer,ObservacionesSerializer,GradosEstudiantesSerializer
from .models import Usuarios,Horarios,Grados,Observaciones,GradosEstudiantes
from django.db.models import Count
from django.http import JsonResponse
from django.contrib.auth.hashers import make_password
from django.contrib.auth.hashers import check_password
import json
from django.views.decorators.csrf import csrf_exempt

class UsuariosView(viewsets.ModelViewSet):
    serializer_class = UserSerializer
    queryset = Usuarios.objects.all()

    def create(self,request, *args, **kwargs):
        contrasenia= request.data.get('contrasenia')
        hashed_password= make_password(contrasenia)
        request.data['contrasenia']=hashed_password
        return super().create(request, *args, **kwargs)
  
class HorariosView(viewsets.ModelViewSet):
    serializer_class=HorariosSerializer
    queryset=Horarios.objects.all()

    
class GradosView(viewsets.ModelViewSet):    
    serializer_class=GradosSerializer
    queryset=Grados.objects.all()

class GradosEstudiantesView(viewsets.ModelViewSet):
    serializer_class=GradosEstudiantesSerializer
    queryset=GradosEstudiantes.objects.all()

class ObservacionesView(viewsets.ModelViewSet):
    serializer_class = ObservacionesSerializer
    queryset = Observaciones.objects.all()
    filter_backends = [filters.SearchFilter]

    def get_queryset(self):
        # Obtener el valor del parámetro 'usuario_documento' de la URL
        usuario_documento = self.request.query_params.get('usuario_documento', None)

        # Filtrar observaciones por el usuario_documento proporcionado
        if usuario_documento is not None:
            return Observaciones.objects.filter(usuario_documento__documento=usuario_documento)
        else:
            return Observaciones.objects.all()


def contar_usuarios_por_rol(request):
    # Obtén la cantidad de usuarios por rol utilizando el ORM de Django
    roles_count = Usuarios.objects.values('rol_idrol').annotate(cantidad=Count('documento'))
    # Diccionario para almacenar los resultados
    resultados = {rol['rol_idrol']: rol['cantidad'] for rol in roles_count}
    return JsonResponse(resultados)


@csrf_exempt
def login_view(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))
        documento = data.get('documento')
        contrasenia = data.get('contrasenia')

        try:
            user = Usuarios.objects.get(documento=documento)
        except Usuarios.DoesNotExist:
            user = None

        if user and check_password(contrasenia, user.contrasenia):
            user_serializer = UserSerializer(user)
            return JsonResponse({"response": 1, "documento": user.documento, "rol":user_serializer.data['rol_idrol']})

        else:

            return JsonResponse({"message": "Invalid credentials"}, status=401)

    return JsonResponse({"message": "Method not allowed"}, status=405)