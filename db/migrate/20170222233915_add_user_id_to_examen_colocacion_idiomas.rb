class AddUserIdToExamenColocacionIdiomas < ActiveRecord::Migration[5.0]
  def change
    add_reference :examen_colocacion_idiomas, :user, foreign_key: true
  end
end
