class AddProyectoTerminalToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_diplomados, :proyecto_terminal, :string
  end
end
