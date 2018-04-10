class AddEstadoToDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :diplomados, :estado, :string
  end
end
