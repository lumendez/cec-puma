class AddAttachmentFotoToCurriculums < ActiveRecord::Migration
  def self.up
    change_table :curriculums do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :curriculums, :foto
  end
end
