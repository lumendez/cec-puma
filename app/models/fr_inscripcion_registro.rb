class FrInscripcionRegistro < ApplicationRecord
  validates :nombre, :grupo_id, :paterno, :materno, :correo, :user_id, :sexo, presence: true
  has_attached_file :imagen, styles: { :medium => "640x" }
  validates_attachment_content_type :imagen, :content_type => /\Aimage\/.*\Z/

  filterrific(
    available_filters: [
      :sorted_by,
      :search_query,
      :with_curso,
      :with_grupo_id,
      :with_documentos_validados
    ]
  )

  belongs_to :grupo

  belongs_to :user

  after_initialize :init

  def init
    self.documentos_validados ||= false if self.has_attribute? :documentos_validados
  end

  def self.buscar(noboleta)
    self.where("inscripcion_registros.boleta = ?", "#{noboleta}")
  end

  paginates_per 35

  def nombre_upcase
    self.nombre.parameterize(separator: ' ').upcase
  end

  def paterno_upcase
    self.paterno.parameterize(separator: ' ').upcase
  end

  def materno_upcase
    self.materno.parameterize(separator: ' ').upcase
  end

  def nombre_completo
    "#{nombre} #{paterno} #{materno}"
  end

  def nombre_paterno_materno
    "#{paterno} #{materno} #{nombre}"
  end

  def promedio
    promedio_decimal = ("#{examen_medio}".to_f + "#{examen_final}".to_f) / 2
    if promedio_decimal.modulo(2) == 1.5
      promedio_decimal.floor
    else
      promedio_decimal.ceil
    end
  end

  def anio_cursado
    "#{created_at.strftime("%Y")}"
  end

  def periodo_anio
     "#{periodo} de #{created_at.strftime("%Y")}"
  end

  #Se obtiene el nombre del curso para mostrarlo en la pantalla de
  #validaciones de los registros de inscripcion
  def nombre_curso
    "#{idioma} #{nivel}"
  end

  #Se obtiene la fecha en que fue creado el registros de inscripción
  #para mostrarlo en en la supervisión
  def creado
    if self.created_at?
      true
    else
      false
    end
  end

  #Se obtiene la oferta para los alumnos de nuevo ingreso con base en que
  #no se detectaron registros de inscripcion previos
  def self.oferta_nuevo_ingreso
    grupos = Grupo.grupos_abiertos_ingles.where(nivel: "Básico 1").
    or(Grupo.grupos_abiertos_frances.where(nivel: "Básico 1").
    or(Grupo.grupos_abiertos_italiano).where(nivel: "Básico 1"))
  end

  def self.oferta_solo_ingles(registro_anterior)
    if registro_anterior.promedio == "0" || registro_anterior.promedio.blank?
      #preguntar que sucede en este caso.
      @grupos = grupos_abiertos_ingles.where(nivel: registro_anterior.nivel).or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 1" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Básico 2").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    #lo reprueba
    elsif registro_anterior.nivel == "Básico 1" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Básico 1").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 2" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Básico 3").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 2" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Básico 2").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 3" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Básico 4").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 3" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Básico 3").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 4" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Básico 5").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 4" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Básico 4").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 5" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Intermedio 1").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Básico 5" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Básico 5").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Intermedio 1" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Intermedio 2%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "Intermedio 1" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "Intermedio 1").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Intermedio 2%" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Intermedio 3%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Intermedio 2%" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Intermedio 2%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Intermedio 3%" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Intermedio 4%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Intermedio 3%" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Intermedio 3%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Intermedio 4%" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Intermedio 5%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Intermedio 4%" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Intermedio 4%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Intermedio 5%" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 1%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Intermedio 5%" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Intermedio 5%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Avanzado 1%" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 2%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Avanzado 1%" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 1%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Avanzado 2%" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 3%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Avanzado 2%" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 2%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Avanzado 3%" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 4%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Avanzado 3%" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 3%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Avanzado 4%" && registro_anterior.promedio >= 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 5%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    elsif registro_anterior.nivel == "%Avanzado 4%" && registro_anterior.promedio < 80
      @grupos = grupos_abiertos_ingles.where(nivel: "%Avanzado 4%").or(grupos_abiertos_frances.where(nivel: "Básico 1").or(grupos_abiertos_italiano.where(nivel: "Básico 1")))
    #Hay que revisar el orden de las certificaciones para inscribirse.
    end
  end

  #def self.ocupacion_grupo
    #ocupacion = self.where(grupo_id: self.grupo_id).count
  #end

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
        "(LOWER(inscripcion_registros.nombre) LIKE ? OR LOWER(inscripcion_registros.paterno) LIKE ? OR LOWER(inscripcion_registros.materno) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^created_at_/
    # Simple sort on the created_at column.
    # Make sure to include the table name to avoid ambiguous column names.
    # Joining on other tables is quite common in Filterrific, and almost
    # every ActiveRecord table has a 'created_at' column.
    order("inscripcion_registros.created_at #{ direction }")
  when /^apellido_/
    # Simple sort on the name colums
    order("LOWER(inscripcion_registros.paterno) #{ direction }, LOWER(inscripcion_registros.materno) #{ direction }")
  else
    raise(ArgumentError, "Opción no válida: #{ sort_option.inspect }")
  end
}

  scope :with_curso, lambda { |cursos|
    where(curso: [*cursos])
  }

  scope :with_grupo_id, lambda { |grupo_ids|
    where(grupo_id: [*grupo_ids])
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

  def self.options_for_sorted_by
    [
      ['Fecha de registro (más recientes primero)', 'created_at_desc'],
      ['Fecha de registro (más viejos primero)', 'created_at_asc'],
      ['Apellido (a-z)', 'apellido_asc']
    ]
  end

end
