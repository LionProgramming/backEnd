from rest_framework import serializers
from .models import Usuarios,Horarios,Grados,Observaciones

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuarios
        fields='__all__'

class HorariosSerializer(serializers.ModelSerializer):
    class Meta:
        model= Horarios
        fields='__all__'

class GradosSerializer(serializers.ModelSerializer):
    class Meta:
        model= Grados
        fields='__all__'

class ObservacionesSerializer(serializers.ModelSerializer):
    class Meta:
        model= Observaciones
        fields='__all__'