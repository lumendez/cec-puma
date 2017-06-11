class AddIdiomaToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :idioma, :string
  end
end
