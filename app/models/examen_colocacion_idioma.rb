class ExamenColocacionIdioma < ApplicationRecord
  validates :nombre, :paterno, :materno, :idioma, :user_id, presence: true
  has_attached_file :imagen
  validates_attachment_content_type :imagen, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  def nombre_completo
    "#{nombre} #{paterno} #{materno}"
  end

  def fecha_expiracion
    self.created_at.advance(weeks: 8).strftime("%d/%m/%y")
  end

end
