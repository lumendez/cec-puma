class AddNombreToCurriculums < ActiveRecord::Migration[5.0]
  def change
    add_column :curriculums, :nombre, :string
  end
end
