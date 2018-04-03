class RemoveTelefonoFijoFromInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    remove_column :inscripcion_diplomados, :telefono_fijo, :string
  end
end
