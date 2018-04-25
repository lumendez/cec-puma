class AddTipoParticipanteToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_diplomados, :tipo_participante, :string
  end
end
