from rest_framework import viewsets
from .serializer import UserSerializer,HorariosSerializer,GradosSerializer,ObservacionesSerializer
from .models import Usuarios,Horarios,Grados,Observaciones

class UsuariosView(viewsets.ModelViewSet):
    serializer_class=UserSerializer
    queryset=Usuarios.objects.all()

class HorariosView(viewsets.ModelViewSet):
    serializer_class=HorariosSerializer
    queryset=Horarios.objects.all()

    
class GradosView(viewsets.ModelViewSet):    
    serializer_class=GradosSerializer
    queryset=Grados.objects.all()

    
class ObservacionesView(viewsets.ModelViewSet):
    serializer_class=ObservacionesSerializer
    queryset=Observaciones.objects.all()