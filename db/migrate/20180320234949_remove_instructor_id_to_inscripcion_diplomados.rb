class RemoveInstructorIdToInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    remove_column :inscripcion_diplomados, :instructor_id, :integer
  end
end
