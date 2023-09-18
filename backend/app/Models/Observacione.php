<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Observacione
 * 
 * @property int $IdObservacion
 * @property string $informe
 * @property int $Usuario_documento
 * 
 * @property Usuario $usuario
 *
 * @package App\Models
 */
class Observacione extends Model
{
	protected $table = 'observaciones';
	protected $primaryKey = 'IdObservacion';
	public $timestamps = false;

	protected $casts = [
		'Usuario_documento' => 'int'
	];

	protected $fillable = [
		'informe',
		'Usuario_documento'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'Usuario_documento');
	}
}
