class AddPaternoToCurriculums < ActiveRecord::Migration[5.0]
  def change
    add_column :curriculums, :paterno, :string
  end
end
