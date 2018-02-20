class AddHabilitarTktToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :habilitar_tkt, :boolean
  end
end
