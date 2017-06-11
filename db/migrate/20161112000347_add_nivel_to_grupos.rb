class AddNivelToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :nivel, :string
  end
end
