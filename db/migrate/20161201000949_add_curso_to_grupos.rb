class AddCursoToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :curso, :string
  end
end
