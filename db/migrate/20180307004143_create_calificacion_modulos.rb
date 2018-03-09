class CreateCalificacionModulos < ActiveRecord::Migration[5.0]
  def change
    create_table :calificacion_modulos do |t|
      t.string :calificacion
      t.references :inscripcion_diplomado, foreign_key: true

      t.timestamps
    end
  end
end
