from rest_framework import serializers
from .models import Usuarios,Horarios,Grados,Observaciones,Roles

class RolesSerializer(serializers.ModelSerializer):
    class Meta:
        model=Roles
        fields='__all__'

class UserSerializer(serializers.ModelSerializer):
    rol_info = RolesSerializer(source='rol', read_only=True)

    class Meta:
        model = Usuarios
        fields = '__all__'
        
    def to_representation(self, instance):
        representation = super(UserSerializer, self).to_representation(instance)
        if 'rol_idrol' in representation:
            rol = representation['rol_idrol']
            if rol == 1:
                representation['rol'] = 'Administrador'
            elif rol ==2:
                representation['rol']= 'Estudiante'
            else: 
                representation['rol']= 'Profesor'
        return representation



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