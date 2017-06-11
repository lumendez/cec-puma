class AddReferenciaToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :referencia, :string
  end
end
