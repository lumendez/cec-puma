class AddPaternoToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :paterno, :string
  end
end
