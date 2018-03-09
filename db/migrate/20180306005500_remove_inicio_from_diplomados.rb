class RemoveInicioFromDiplomados < ActiveRecord::Migration[5.0]
  def change
    remove_column :diplomados, :inicio, :string
  end
end
