from django.urls import path, include
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
#Se deben agregar las rutas dependiendo de las vistas y como se quiera tener el nombre en el url
#Ejemplo : http://127.0.0.1:8000/api/v1/horarios/

router.register(r'users', views.UsuariosView, 'usuarios')
router.register(r'horarios', views.HorariosView, 'horarios')
router.register(r'grados', views.GradosView, 'grados')
router.register(r'observaciones', views.ObservacionesView, 'observaciones')
router.register(r'gradosEstudiantes',views.GradosEstudiantesView,'Cantidad de estudiantes por grado')

urlpatterns = [
    path('', include(router.urls)),
    path('contar_usuarios_por_rol/', views.contar_usuarios_por_rol, name='contar_usuarios_por_rol'),
    path('login/',views.login_view,name='login')
]
