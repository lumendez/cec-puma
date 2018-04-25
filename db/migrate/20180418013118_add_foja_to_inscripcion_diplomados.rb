class AddFojaToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_diplomados, :foja, :string
  end
end
