class RemoveProcedenciaFromInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    remove_column :inscripcion_diplomados, :procedencia, :string
  end
end
