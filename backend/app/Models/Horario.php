<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Horario
 * 
 * @property int $idHorario
 * @property string|null $urlHorario
 * @property int $numero
 * 
 * @property Grado $grado
 *
 * @package App\Models
 */
class Horario extends Model
{
	protected $table = 'horarios';
	protected $primaryKey = 'idHorario';
	public $timestamps = false;

	protected $casts = [
		'numero' => 'int'
	];

	protected $fillable = [
		'urlHorario',
		'numero'
	];

	public function grado()
	{
		return $this->belongsTo(Grado::class, 'numero');
	}
}
