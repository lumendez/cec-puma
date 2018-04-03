class AddNumeroModulosToGruposDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos_diplomados, :numero_modulos, :integer
  end
end
