class AddDiplomadoIdToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_reference :inscripcion_diplomados, :diplomado, foreign_key: true
  end
end
