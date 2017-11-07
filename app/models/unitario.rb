class Unitario < ApplicationRecord

  has_attached_file :image, styles: { thumb: "100x150", medium: '200x250'}

  belongs_to :grupos_unitario
  validates :curp, :nombre, :paterno, :materno, :sexo, :nacimiento, :telefono_celular,
  :correo, :sexo, presence: true

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

  def paterno_materno_nombre
    "#{paterno} #{materno} #{nombre}"
  end

  def nombre_paterno_materno
    "#{nombre} #{paterno} #{materno}"
  end

  def creado
    self.created_at.strftime("%d/%m/%y a las %T %P")
  end

  def anio
    self.created_at.strftime("%Y")
  end

  def self.buscar(folio_carta)
    self.find_by(id: folio_carta)
  end

end
