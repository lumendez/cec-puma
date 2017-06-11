class AddHabilitarConstanciaToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :habilitar_constancia, :boolean
  end
end
