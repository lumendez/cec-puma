class AddSeccionToGruposUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos_unitarios, :seccion, :string
  end
end
