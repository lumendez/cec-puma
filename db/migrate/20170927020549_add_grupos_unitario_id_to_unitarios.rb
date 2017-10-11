class AddGruposUnitarioIdToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_reference :unitarios, :grupos_unitario, foreign_key: true
  end
end
