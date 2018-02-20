class AddHabilitarB2ToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :habilitar_b2, :boolean
  end
end
