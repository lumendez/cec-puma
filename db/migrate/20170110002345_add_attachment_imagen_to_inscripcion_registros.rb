class AddAttachmentImagenToInscripcionRegistros < ActiveRecord::Migration
  def self.up
    change_table :inscripcion_registros do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :inscripcion_registros, :imagen
  end
end
