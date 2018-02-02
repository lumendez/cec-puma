class ExamenColocacionIdioma < ApplicationRecord
  validates :nombre, :paterno, :materno, :idioma, :user_id, presence: true
  has_attached_file :imagen
  validates_attachment_content_type :imagen, :content_type => /\Aimage\/.*\Z/

  filterrific(
    available_filters: [
      :search_query
    ]
  )

  paginates_per 35

  belongs_to :user

  def nombre_completo
    "#{nombre} #{paterno} #{materno}"
  end

  def fecha_expiracion
    self.created_at.advance(weeks: 8).strftime("%d/%m/%y")
  end

  def nombres_upcase
    self.nombre.parameterize(separator: ' ').upcase
  end

  def paterno_upcase
    self.paterno.parameterize(separator: ' ').upcase
  end

  def materno_upcase
    self.materno.parameterize(separator: ' ').upcase
  end

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
    num_or_conds = 3

    where(
      terms.map { |term|
        "(LOWER(examen_colocacion_idiomas.nombre) LIKE ? OR LOWER(examen_colocacion_idiomas.paterno) LIKE ? OR LOWER(examen_colocacion_idiomas.materno) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

end
