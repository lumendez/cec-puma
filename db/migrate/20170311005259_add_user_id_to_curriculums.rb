class AddUserIdToCurriculums < ActiveRecord::Migration[5.0]
  def change
    add_reference :curriculums, :user, foreign_key: true
  end
end
