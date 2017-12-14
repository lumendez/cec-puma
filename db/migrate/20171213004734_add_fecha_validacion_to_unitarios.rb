class AddFechaValidacionToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :fecha_validacion, :datetime
  end
end
