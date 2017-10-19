class AddAttachmentImageToUnitarios < ActiveRecord::Migration
  def self.up
    change_table :unitarios do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :unitarios, :image
  end
end
