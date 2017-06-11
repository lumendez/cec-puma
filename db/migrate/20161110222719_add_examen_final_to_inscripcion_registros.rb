class AddExamenFinalToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :examen_final, :integer
  end
end
