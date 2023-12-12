from rest_framework import serializers
from .models import Usuarios,Horarios,Grados,Observaciones,Roles,GradosEstudiantes

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
    nombre =serializers.SerializerMethodField()
    class Meta: 
        model=Horarios
        fields='__all__'
    
    def get_nombre(self,obj):
        return obj.numero_curso.nombre if obj.numero_curso else None
  

class GradosSerializer(serializers.ModelSerializer):
    director_nombre = serializers.SerializerMethodField(read_only=True)
    def get_director_nombre(self, obj):
        nombre1=obj.director.nombre1
        nombre2=obj.director.nombre2 if obj.director.nombre2 else ''
        apellido1=obj.director.apellido1 
        apellido2=obj.director.apellido2 if obj.director.apellido2 else ''
        return f"{nombre1} {nombre2} {apellido1} {apellido2}"
    class Meta:
        model= Grados
        fields=['numero','salonasignado','nombre','anio','director','director_nombre']

   

class ObservacionesSerializer(serializers.ModelSerializer):
    class Meta:
        model= Observaciones
        fields='__all__'


class GradosEstudiantesSerializer(serializers.ModelSerializer):
    class Meta:
        model=GradosEstudiantes
        fields='__all__'