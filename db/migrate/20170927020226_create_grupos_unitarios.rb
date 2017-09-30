class CreateGruposUnitarios < ActiveRecord::Migration[5.0]
  def change
    create_table :grupos_unitarios do |t|
      t.string :nombre
      t.string :horario
      t.string :estado
      t.string :anio
      t.string :periodo
      t.string :lugar
      t.string :fecha
      t.string :centro
      t.string :tipo
      t.string :modalidad
      t.string :cupo
      t.string :duracion
      t.string :cuota
      t.string :clave
      t.string :proyecto
      t.string :institucion_bancaria
      t.string :cuenta
      t.string :titular
      t.string :jefe_ec
      t.string :registro
      t.string :referencia
      t.boolean :habilitar_constancias_grupo

      t.timestamps
    end
  end
end
