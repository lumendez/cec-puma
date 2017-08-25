class AddAttachmentImagenToItInscripcionRegistros < ActiveRecord::Migration
  def self.up
    change_table :it_inscripcion_registros do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :it_inscripcion_registros, :imagen
  end
end
