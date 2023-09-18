<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Role
 * 
 * @property int $idRol
 * @property string $rol
 * 
 * @property Collection|Usuario[] $usuarios
 *
 * @package App\Models
 */
class Role extends Model
{
	protected $table = 'roles';
	protected $primaryKey = 'idRol';
	public $timestamps = false;

	protected $fillable = [
		'rol'
	];

	public function usuarios()
	{
		return $this->hasMany(Usuario::class, 'Rol_idRol');
	}
}
