from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Grados(models.Model):
    numero = models.AutoField(primary_key=True, db_comment='Identificador en forma de presentaci¾n numÚrica o alfanumÚrica que muestra el nivel en el que estß clasificado el Estudiante (Este campo es obligatorio).')
    salonasignado = models.IntegerField(db_column='salonAsignado', db_comment='Espacio designado para la instrucci¾n de Profesor a Estudiante (Este campo es obligatorio).')  # Field name made lowercase.
    nombre = models.IntegerField()
    anio = models.CharField(max_length=4, blank=True, null=True)
    director = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='director',null=True)

    def __str__(self) -> str:
        return f"{self.nombre}"
    class Meta:
        managed = False
        db_table = 'grados'


class Horarios(models.Model):
    idhorario = models.AutoField(db_column='idHorario', primary_key=True,)  # Field name made lowercase.
    urlhorario = models.CharField(db_column='urlHorario', max_length=200)  # Field name made lowercase.
    numero_curso = models.ForeignKey(Grados, models.DO_NOTHING, db_column='numero_curso', related_name='horarios')

    def __str__(self) -> str:
        return f"{self.urlhorario} {self.numero_curso}"
    class Meta:
        managed = False
        db_table = 'horarios'


class Matriculas(models.Model):
    usuario_documento = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='Usuario_documento')  # Field name made lowercase.
    estado = models.IntegerField()
    usuario_grado = models.OneToOneField(Grados, models.DO_NOTHING, db_column='Usuario_grado', primary_key=True)  # Field name made lowercase. The composite primary key (Usuario_grado, Usuario_documento) found, that is not supported. The first column is selected.

    class Meta:
        managed = False
        db_table = 'matriculas'
        unique_together = (('usuario_grado', 'usuario_documento'),)


class Migrations(models.Model):
    migration = models.CharField(max_length=255)
    batch = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'migrations'


class Observaciones(models.Model):
    idobservacion = models.AutoField(db_column='IdObservacion', primary_key=True, db_comment='Identificador no repetible del registro en la tabla Observacion (Este campo es obligatorio).')  # Field name made lowercase.
    informe = models.CharField(max_length=1000, db_comment='Representacion escrita detallada sobre el o los hechos representativos sobre circunstancias de Estudiante (Este campo es obligatorio).')
    usuario_documento = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='Usuario_documento', db_comment='Llave primaria foranea de la tabla Usuario (Este campo es obligatorio).')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'observaciones'
    

class PersonalAccessTokens(models.Model):
    id = models.BigAutoField(primary_key=True)
    tokenable_type = models.CharField(max_length=255)
    tokenable_id = models.PositiveBigIntegerField()
    name = models.CharField(max_length=255)
    token = models.CharField(unique=True, max_length=64)
    abilities = models.TextField(blank=True, null=True)
    last_used_at = models.DateTimeField(blank=True, null=True)
    expires_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'personal_access_tokens'


class Roles(models.Model):
    idrol = models.AutoField(db_column='idRol', primary_key=True, db_comment='Identificador de Rol con sus correspondientes permisos (Este campo es obligatorio).')  # Field name made lowercase.
    rol = models.CharField(max_length=45, db_comment='Funci¾n o conjunto de funciones que desempe±a cada Usuario en el software (Este campo es obligatorio).')

    def __str__(self) -> str:
        return self.rol
    class Meta:
        managed = False
        db_table = 'roles'


class Tiposdocumentos(models.Model):
    idtipodocumento = models.AutoField(db_column='idTipoDocumento', primary_key=True, db_comment='Llave foranea de tipo de identificacion de Usuario (Este campo es obligatorio).')  # Field name made lowercase.
    tipodocumento = models.CharField(db_column='tipoDocumento', max_length=4, db_comment='Expresa en siglas o abreviaciones el tipo de documento que posee el Usuario (Este campo es obligatorio).')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tiposdocumentos'


class Usuarios(models.Model):
    documento = models.IntegerField(primary_key=True)
    fechanacimiento = models.DateField(db_column='fechaNacimiento', )  # Field name made lowercase.
    nombre1 = models.CharField(max_length=45, )
    nombre2 = models.CharField(max_length=45, blank=True, null=True)
    apellido1 = models.CharField(max_length=45)
    apellido2 = models.CharField(max_length=45, blank=True, null=True)
    email = models.CharField(unique=True, max_length=100)
    telefono_fijo = models.BigIntegerField(blank=True, null=True)
    telefono_celular = models.BigIntegerField()
    contrasenia = models.CharField(max_length=200)
    urlfoto = models.CharField(db_column='urlFoto', max_length=200, blank=True, null=True)  # Field name made lowercase.
    tipo_idtipodocumento = models.ForeignKey(Tiposdocumentos, models.DO_NOTHING, db_column='Tipo_idTipoDocumento',)#Field name made lowercase.
    rol_idrol = models.ForeignKey(Roles, models.DO_NOTHING, db_column='Rol_idRol')  # Field name made lowercase.
    estado = models.IntegerField(db_column='Estado')  # Field name made lowercase.
    curso=models.ForeignKey(Grados, models.DO_NOTHING, db_column='curso',null=True)

    def __str__(self) -> str:
        if self.nombre2 and self.apellido2:
            return f"{self.nombre1} {self.nombre2} {self.apellido1} {self.apellido2}" 
        if self.nombre2 and not self.apellido2:
            return f"{self.nombre1} {self.nombre2} {self.apellido1}"
        else:
            return f"{self.nombre1} {self.apellido1}"
        
    class Meta:
        managed = False
        db_table = 'usuarios'

class GradosEstudiantes(models.Model):
    idGrados=models.AutoField(primary_key=True)
    grados_id=models.ForeignKey(Grados,models.DO_NOTHING,db_column="grados_id")
    usuarios_id=models.ForeignKey(Usuarios, models.DO_NOTHING,db_column="usuarios_id")

    class Meta:
        managed=False
        db_table='grados_estudiantes'

    
