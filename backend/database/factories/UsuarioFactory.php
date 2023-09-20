<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Generator as Faker;

use App\Models\Usuario;

class UsuarioFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'documento' => $this->faker->unique()->randomNumber(8),
            'fechaNacimiento' => $this->faker->date,
            'nombre1' => $this->faker->firstName,
            'nombre2' => $this->faker->optional()->firstName,
            'apellido1' => $this->faker->lastName,
            'apellido2' => $this->faker->optional()->lastName,
            'email' => $this->faker->unique()->safeEmail,
            'telefono_fijo' => $this->faker->optional()->randomNumber(7),
            'telefono_celular' => $this->faker->randomNumber(7),
            'contrasenia' =>('seta'),
            'urlFoto' => $this->faker->optional()->imageUrl(200, 200),
            'Tipo_idTipoDocumento' => $this->faker->numberBetween(1, 3), 
            'Rol_idRol' => $this->faker->numberBetween(1, 3),
            'Estado' => $this->faker->numberBetween(1, 2),
        ];
    }
}
/* para agregar randoms */
/* php artisan db:seed --class=UsuariosSeeder */
