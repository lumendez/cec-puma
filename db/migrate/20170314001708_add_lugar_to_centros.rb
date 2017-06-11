class AddLugarToCentros < ActiveRecord::Migration[5.0]
  def change
    add_column :centros, :lugar, :string
  end
end
