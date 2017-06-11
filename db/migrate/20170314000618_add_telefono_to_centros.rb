class AddTelefonoToCentros < ActiveRecord::Migration[5.0]
  def change
    add_column :centros, :telefono, :string
  end
end
