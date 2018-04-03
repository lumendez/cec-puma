class RemoveInstructorFromModuloDiplomados < ActiveRecord::Migration[5.0]
  def change
    remove_column :modulo_diplomados, :instructor, :string
  end
end
