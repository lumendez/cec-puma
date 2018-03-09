class RemoveTerminoFromDiplomados < ActiveRecord::Migration[5.0]
  def change
    remove_column :diplomados, :termino, :string
  end
end
