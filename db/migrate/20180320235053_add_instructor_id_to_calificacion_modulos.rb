class AddInstructorIdToCalificacionModulos < ActiveRecord::Migration[5.0]
  def change
    add_column :calificacion_modulos, :instructor_id, :integer
  end
end
