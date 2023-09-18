<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Matricula
 * 
 * @property int $Usuario_documento
 * @property int $Grado_numero
 * @property int $estado
 * 
 * @property Grado $grado
 * @property Usuario $usuario
 *
 * @package App\Models
 */
class Matricula extends Model
{
	protected $table = 'matriculas';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'Usuario_documento' => 'int',
		'Grado_numero' => 'int',
		'estado' => 'int'
	];

	protected $fillable = [
		'estado'
	];

	public function grado()
	{
		return $this->belongsTo(Grado::class, 'Grado_numero');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'Usuario_documento');
	}
}
