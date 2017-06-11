class AddMaternoToCurriculums < ActiveRecord::Migration[5.0]
  def change
    add_column :curriculums, :materno, :string
  end
end
