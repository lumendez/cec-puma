class AddNumeroEmpleadoToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_diplomados, :numero_empleado, :string
  end
end
