class AddUserIdToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_reference :inscripcion_registros, :user, foreign_key: true
  end
end
