class AddInstructorIdToModuloDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :modulo_diplomados, :instructor_id, :integer
  end
end
