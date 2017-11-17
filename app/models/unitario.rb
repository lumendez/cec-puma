class Unitario < ApplicationRecord

  #Filtros de filterrific
         filterrific(
           available_filters: [
             :search_query,
             :with_grupos_unitario_id,
             :with_documentos_validados
           ]
         )

  paginates_per 25

  has_attached_file :image, styles: { thumb: "100x150", medium: '200x250'}

  belongs_to :grupos_unitario
  validates :curp, :nombre, :paterno, :materno, :sexo, :nacimiento, :telefono_celular,
  :correo, :sexo, presence: true

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

  after_initialize :solicito_beca_inicial, :trabajador_familiar, :validacion

  def validacion
    self.documentos_validados ||= false if self.has_attribute? :documentos_validados
  end

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

  #Definición de los filtros para filterrific
  scope :search_query, lambda { |query|

    # Filtra a los usuarios por nombre o apellido paterno
    return nil  if query.blank?

    # Condiciones del query divididas en palabras separadas y en minúsculas
    terms = query.downcase.split(/\s+/)

    # Reemplaza "*" con "%" para búsquedas con comodin,
    # liga '%', quita los '%' duplicados
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    # Configura el numero de condiciones OR proporcionados (provision)
    # como argumentos de interpolación. Ajustar si se cambian el
    # número de condiciones OR.
    num_or_conds = 2

    where(
      terms.map { |term|
        "(LOWER(unitarios.nombre) LIKE ? OR LOWER(unitarios.paterno) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  scope :with_grupos_unitario_id, lambda { |grupos_unitario_ids|
    # Se filtra a los usuarios dependiendo del grupos_unitario_id dado
    where(grupos_unitario_id: [*grupos_unitario_ids])
  }

  scope :with_documentos_validados, lambda { |documentos_validados|
    where(documentos_validados: [*documentos_validados])
  }

  def self.options_for_documentos_validados
    [
      ['Validado','1'],
      ['No validado', '0']
    ]
  end

end
