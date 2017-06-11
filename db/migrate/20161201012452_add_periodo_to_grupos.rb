class AddPeriodoToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :periodo, :string
  end
end
