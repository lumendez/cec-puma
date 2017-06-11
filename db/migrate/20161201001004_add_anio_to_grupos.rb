class AddAnioToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :anio, :string
  end
end
