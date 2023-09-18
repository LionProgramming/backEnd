<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Usuario
 * 
 * @property int $documento
 * @property Carbon $fechaNacimiento
 * @property string $nombre1
 * @property string|null $nombre2
 * @property string $apellido1
 * @property string|null $apellido2
 * @property string $email
 * @property int|null $telefono_fijo
 * @property int $telefono_celular
 * @property string $contrasenia
 * @property string|null $urlFoto
 * @property int $Tipo_idTipoDocumento
 * @property int $Rol_idRol
 * @property int $Estado
 * 
 * @property Role $role
 * @property Tiposdocumento $tiposdocumento
 * @property Collection|Grado[] $grados
 * @property Collection|Matricula[] $matriculas
 * @property Collection|Observacione[] $observaciones
 *
 * @package App\Models
 */
class Usuario extends Model
{
	protected $table = 'usuarios';
	protected $primaryKey = 'documento';
	public $timestamps = false;

	protected $casts = [
		'fechaNacimiento' => 'date',
		'telefono_fijo' => 'int',
		'telefono_celular' => 'int',
		'Tipo_idTipoDocumento' => 'int',
		'Rol_idRol' => 'int',
		'Estado' => 'int'
	];

	protected $fillable = [
		'fechaNacimiento',
		'nombre1',
		'nombre2',
		'apellido1',
		'apellido2',
		'email',
		'telefono_fijo',
		'telefono_celular',
		'contrasenia',
		'urlFoto',
		'Tipo_idTipoDocumento',
		'Rol_idRol',
		'Estado'
	];

	public function role()
	{
		return $this->belongsTo(Role::class, 'Rol_idRol');
	}

	public function tiposdocumento()
	{
		return $this->belongsTo(Tiposdocumento::class, 'Tipo_idTipoDocumento');
	}

	public function grados()
	{
		return $this->hasMany(Grado::class, 'director');
	}

	public function matriculas()
	{
		return $this->hasMany(Matricula::class, 'Usuario_documento');
	}

	public function observaciones()
	{
		return $this->hasMany(Observacione::class, 'Usuario_documento');
	}
}
