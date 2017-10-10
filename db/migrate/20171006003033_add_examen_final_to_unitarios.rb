class AddExamenFinalToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :examen_final, :string
  end
end
