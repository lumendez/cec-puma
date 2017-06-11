class AddDireccionToCentros < ActiveRecord::Migration[5.0]
  def change
    add_column :centros, :direccion, :string
  end
end
