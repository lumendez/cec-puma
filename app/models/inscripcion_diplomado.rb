class InscripcionDiplomado < ApplicationRecord
  belongs_to :grupos_diplomado
  has_many :calificacion_modulos, dependent: :destroy
  accepts_nested_attributes_for :calificacion_modulos, allow_destroy: true

  #Filtros de filterrific disponibles para el controlador
  filterrific(
    available_filters: [
      :search_query,
      :with_grupos_unitario_id,
      :with_documentos_validados,
    ]
  )

  # Número de páginas por vista
  paginates_per 25


  #Filtro para buscar por nombre o apellido
  scope :search_query, lambda { |query|

    # No devuelve resultados si el campo de texto está en blanco
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
    num_or_conds = 3

    where(
      terms.map { |term|
        "(LOWER(inscripcion_diplomados.nombre) LIKE ? OR LOWER(inscripcion_diplomados.paterno) LIKE ?
        OR LOWER(inscripcion_diplomados.materno) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  # Filtro para agrupas los registros de inscripción por grupos
  scope :with_grupos_diplomado_id, lambda { |grupos_diplomado_ids|
    # Se filtra a los usuarios dependiendo del grupos_diplomado_id dado
    where(grupos_diplomado_id: [*grupos_diplomado_ids])
  }

  # Filtro para agrupar los registros de inscripción por la validación de documentos
  scope :with_documentos_validados, lambda { |documentos_validados|
    where(documentos_validados: [*documentos_validados])
  }

  # Opciones para la lista de selección del filtro ":with_documentos_validados"
  def self.options_for_documentos_validados
    [
      ['Validado','1'],
      ['No validado', '0']
    ]
  end

end
