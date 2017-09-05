class AddAttachmentImagenToFrInscripcionRegistros < ActiveRecord::Migration
  def self.up
    change_table :fr_inscripcion_registros do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :fr_inscripcion_registros, :imagen
  end
end
