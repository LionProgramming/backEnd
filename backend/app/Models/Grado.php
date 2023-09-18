<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Grado
 * 
 * @property int $numero
 * @property int $salonAsignado
 * @property int $cantidadEstudiantes
 * @property string $nombre
 * @property string|null $anio
 * @property int $director
 * 
 * @property Usuario $usuario
 * @property Collection|Horario[] $horarios
 * @property Collection|Matricula[] $matriculas
 *
 * @package App\Models
 */
class Grado extends Model
{
	protected $table = 'grados';
	protected $primaryKey = 'numero';
	public $timestamps = false;

	protected $casts = [
		'salonAsignado' => 'int',
		'cantidadEstudiantes' => 'int',
		'director' => 'int'
	];

	protected $fillable = [
		'salonAsignado',
		'cantidadEstudiantes',
		'nombre',
		'anio',
		'director'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'director');
	}

	public function horarios()
	{
		return $this->hasMany(Horario::class, 'numero');
	}

	public function matriculas()
	{
		return $this->hasMany(Matricula::class, 'Grado_numero');
	}
}
