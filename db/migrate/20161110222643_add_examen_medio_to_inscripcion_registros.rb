class AddExamenMedioToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :examen_medio, :integer
  end
end
