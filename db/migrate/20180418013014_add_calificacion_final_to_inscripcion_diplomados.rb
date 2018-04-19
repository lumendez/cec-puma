class AddCalificacionFinalToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_diplomados, :calificacion_final, :string
  end
end
