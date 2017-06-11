class AddAttachmentImagenToExamenColocacionIdiomas < ActiveRecord::Migration
  def self.up
    change_table :examen_colocacion_idiomas do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :examen_colocacion_idiomas, :imagen
  end
end
