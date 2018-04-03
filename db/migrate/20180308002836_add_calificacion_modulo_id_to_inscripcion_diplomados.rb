class AddCalificacionModuloIdToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_reference :inscripcion_diplomados, :calificacion_modulo, foreign_key: true
  end
end
