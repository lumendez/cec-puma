class Grupo < ApplicationRecord

  validates :cupo, :duracion, :periodo, :fecha, presence: true

  belongs_to :profesor_nombre

  belongs_to :user

  has_many :inscripcion_registros

  has_paper_trail

  after_initialize :init

  serialize :cambios, Hash

  filterrific(
    available_filters: [
      :sorted_by,
      :search_query,
      :with_curso
    ]
  )

  def init
    self.estado ||= 'Pendiente' if self.has_attribute? :estado
  end

  paginates_per 25

  def nombre_completo
    "#{nombre} #{paterno} #{materno}"
  end

  def nombre_grupo
    "#{idioma} #{nivel.downcase}"
  end

  def jefe_educacion_continua
    rol = Role.find_by(nombre: "Jefe Educación Continua").id
    usuarios = User.find_by(role: rol).nombre_paterno_materno
  end

  def director_centro
    rol = Role.find_by(nombre: "Director del Centro").id
    usuarios = User.find_by(role: rol).nombre_paterno_materno
  end

  def quien_creo
    id = self.versions.first.whodunnit
    User.find(id)
  end

  def quien_actualizo
    id = self.versions.last.whodunnit
    User.find(id)
  end

  def trail_habilitar_constancias
    if self.paper_trail.previous_version.present?
      self.paper_trail.previous_version.habilitar_constancias_grupo
    else
      self.paper_trail.version_at('created_at').habilitar_constancias_grupo
    end
  end

  def trail_estado
    if self.paper_trail.previous_version.present?
      self.paper_trail.previous_version.estado
    else
      self.paper_trail.version_at('created_at').estado
    end
  end

  def trail_instructor
    if self.paper_trail.previous_version.present?
      self.paper_trail.previous_version.user.nombre_paterno_materno
    else
      self.paper_trail.version_at('created_at').user.nombre_paterno_materno
    end
  end

  def ultimo_evento
    if self.versions.last.event == "update"
      "Actualización"
    elsif self.versions.last.event == "create"
      "Creó"
    elsif self.versions.last.event == "destroy"
      "Eliminó"
    end
  end

  def cambios
    self.versions.last.changeset
  end

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      # Simple sort on the created_at column.
      # Make sure to include the table name to avoid ambiguous column names.
      # Joining on other tables is quite common in Filterrific, and almost
      # every ActiveRecord table has a 'created_at' column.
      order("grupos.created_at #{ direction }")
    when /^idioma_/
      # Simple sort on the name colums
      order("LOWER(grupos.idioma) #{ direction }")
    when /^curso_/
      # Simple sort on the name colums
      order("LOWER(grupos.curso) #{ direction }")
    when /^estado_/
      # Simple sort on the name colums
      order("LOWER(grupos.estado) #{ direction }")
    else
      raise(ArgumentError, "Opción no válida: #{ sort_option.inspect }")
    end
  }

  scope :with_curso, lambda { |cursos|
    where(curso: [*cursos])
  }

  def self.options_for_sorted_by
    [
      ['Idioma (A-Z)', 'idioma_asc'],
      ['Idioma (Z-A)', 'idioma_desc'],
      ['Curso (A-Z)', 'curso_asc'],
      ['Curso (Z-A)', 'curso_desc'],
      ['Estado (A-Z)', 'estado_asc'],
      ['Estado (Z-A)', 'estado_desc']
    ]
  end

  def self.options_for_select
    order('created_at').map { |e| [e.nombre, e.id] }
  end

end
