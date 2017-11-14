class Unitario < ApplicationRecord

  paginates_per 25

  has_attached_file :image, styles: { thumb: "100x150", medium: '200x250'}

  belongs_to :grupos_unitario
  validates :curp, :nombre, :paterno, :materno, :sexo, :nacimiento, :telefono_celular,
  :correo, :sexo, presence: true

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

  after_initialize :solicito_beca_inicial, :trabajador_familiar

  def solicito_beca_inicial
    self.solicito_beca ||= false if self.has_attribute? :solicito_beca
  end

  def trabajador_familiar
    self.familiar_ipn ||= false if self.has_attribute? :familiar_ipn
  end

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
    self.find_by(curp: folio_carta)
  end

end
