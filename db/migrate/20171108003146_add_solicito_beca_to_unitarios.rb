class AddSolicitoBecaToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :solicito_beca, :boolean
  end
end
