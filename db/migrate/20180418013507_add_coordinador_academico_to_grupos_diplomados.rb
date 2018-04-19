class AddCoordinadorAcademicoToGruposDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos_diplomados, :coordinador_academico, :string
  end
end
