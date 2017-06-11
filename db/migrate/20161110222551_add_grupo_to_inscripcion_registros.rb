class AddGrupoToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_reference :inscripcion_registros, :grupo, foreign_key: true
  end
end
