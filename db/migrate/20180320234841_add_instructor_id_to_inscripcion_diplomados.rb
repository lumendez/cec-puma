class AddInstructorIdToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_diplomados, :instructor_id, :integer
  end
end
