class Calendario < ApplicationRecord
  validates :nombre, :registro, :examen_colocacion, :inicio_curso, :examen_medio, :examen_final, :entrega_boletas, presence: true

  after_initialize :init

  belongs_to :user

  #Filtros de filterrific
  filterrific(
    available_filters: [
      :sorted_by,
      :search_query
    ]
  )

  scope :search_query, lambda { |query|

    # Filters students whose name or email matches the query
    return nil  if query.blank?

    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 2

    where(
      terms.map { |term|
        "(LOWER(calendarios.nombre) LIKE ? OR LOWER(calendarios.anio) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^anio_/
    # Ordenar por año
    order("calendarios.anio #{ direction }")
  when /^estado_/
    # Ordenar por estado
    order("calendarios.estado #{ direction }")
  else
    raise(ArgumentError, "Opción no válida: #{ sort_option.inspect }")
  end
}

  def self.options_for_sorted_by
    [
      ['Año', 'anio_asc'],
      ['Estado', 'estado_asc']
    ]
  end

  def init
    self.estado ||= 'Cerrado' if self.has_attribute? :estado
    self.anio ||= Time.now.year if self.has_attribute? :anio
  end

end
