class AddEstadoToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :estado, :string
  end
end
