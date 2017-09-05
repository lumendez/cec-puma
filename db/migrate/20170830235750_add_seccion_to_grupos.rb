class AddSeccionToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :seccion, :string
  end
end
