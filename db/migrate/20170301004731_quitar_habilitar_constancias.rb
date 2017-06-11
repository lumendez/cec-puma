class QuitarHabilitarConstancias < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :inscripcion_registros, :habilitar_constancias
  end
end
