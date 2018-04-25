class AddAdscripcionToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_diplomados, :adscripcion, :string
  end
end
