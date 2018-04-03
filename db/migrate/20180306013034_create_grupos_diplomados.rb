class CreateGruposDiplomados < ActiveRecord::Migration[5.0]
  def change
    create_table :grupos_diplomados do |t|
      t.string :nombre
      t.string :horario
      t.string :estado
      t.string :anio
      t.string :inicio
      t.string :termino
      t.string :horario
      t.string :lugar
      t.string :fecha
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
      t.boolean :habilitar_constancias

      t.timestamps
    end
  end
end
