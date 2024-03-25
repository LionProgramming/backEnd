"""
URL configuration for lyonBack project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from rest_framework.documentation import include_docs_urls 
from task import views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/', include('task.urls')),  # Ruta principal para la API
    path('docs/', include_docs_urls(title="Lyon Programming API's")), #documentacion de la api
    path('contar_usuarios_por_rol/', views.contar_usuarios_por_rol, name='contar_usuarios_por_rol'),
    path('login/',views.login_view, name='login')
    #Para ver la documentacion completa: http://127.0.0.1:8000/docs
]
