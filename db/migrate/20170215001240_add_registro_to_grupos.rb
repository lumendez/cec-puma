class AddRegistroToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :registro, :string
  end
end
