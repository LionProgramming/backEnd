from rest_framework import viewsets,filters
from rest_framework.response import Response
from .serializer import UserSerializer,HorariosSerializer,GradosSerializer,ObservacionesSerializer,RolesSerializer
from .models import Usuarios,Horarios,Grados,Observaciones
from django.db.models import Count
from django.http import JsonResponse

class UsuariosView(viewsets.ModelViewSet):
    serializer_class = UserSerializer
    queryset = Usuarios.objects.all()

  
class HorariosView(viewsets.ModelViewSet):
    serializer_class=HorariosSerializer
    queryset=Horarios.objects.all()

    
class GradosView(viewsets.ModelViewSet):    
    serializer_class=GradosSerializer
    queryset=Grados.objects.all()

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
