class AddDiplomadoIdToGruposDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_reference :grupos_diplomados, :diplomado, foreign_key: true
  end
end
