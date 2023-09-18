<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Tiposdocumento
 * 
 * @property int $idTipoDocumento
 * @property string $tipoDocumento
 * 
 * @property Collection|Usuario[] $usuarios
 *
 * @package App\Models
 */
class Tiposdocumento extends Model
{
	protected $table = 'tiposdocumentos';
	protected $primaryKey = 'idTipoDocumento';
	public $timestamps = false;

	protected $fillable = [
		'tipoDocumento'
	];

	public function usuarios()
	{
		return $this->hasMany(Usuario::class, 'Tipo_idTipoDocumento');
	}
}
