class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #Opciones de devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Filtros de filterrific
         filterrific(
           available_filters: [
             :search_query,
             :with_role_id,
           ]
         )

  #Asociaciones con otros modelos
  belongs_to :role

  belongs_to :centro

  has_many :inscripcion_registros, dependent: :destroy

  has_many :fr_inscripcion_registros, dependent: :destroy

  has_many :it_inscripcion_registros, dependent: :destroy

  before_save :assign_role

  before_save :assign_centro

  has_many :grupos

  has_many :calendarios

  has_many :examen_colocacion_idiomas

  has_many :curriculums, dependent: :destroy

  #Opciones de kaminari para la paginación de los registros del modelo (25 en este caso)
  paginates_per 25

  #Definición de roles para devise
  def assign_role
    self.role = Role.find_by nombre: "Invitado" if self.role.nil?
  end

  #Definición de roles para devise
  def assign_centro
    self.centro = Centro.find_by nombre: "Ingeniero Eugenio Méndez Docurro" if self.centro.nil?
  end

  #Definiciones de los roles dentro del sistema
  def invitado?
    self.role.nombre == "Invitado"
  end

  def profesor?
    self.role.nombre == "Profesor"
  end

  def control_cec?
    self.role.nombre == "Control escolar"
  end

  def coordinador_celex?
    self.role.nombre = "Coordinación CELEX"
  end

  def admin?
    self.role.nombre == "Administrador"
  end

  def jefe_ec?
    self.role.nombre == "Jefe Educación Continua"
  end

  def jefe_cec?
    self.role.nombre == "Director del Centro"
  end

  def control_ec?
    self.role.nombre == "Control Educación Continua"
  end

  #Se utiliza para mostrar el nombre completo de un usuario, principalmente de
  #los alumnos, de esta forma en las listas de registros de inscripción aparecen
  #primero por apellidos para que puedan buscarse de forma más sencilla
  def nombre_completo
    "#{paterno} #{materno} #{nombre}"
  end

  #Se usa para darle el formato "Nombre(s) Apellido Paterno Apellido Materno" a
  #los usuarios en los historiales académicos y en las constancias de idioma.
  def nombre_paterno_materno
    "#{nombre} #{paterno} #{materno}"
  end

  def nombre_upcase
    self.nombre_completo.parameterize(separator: ' ').upcase
  end

  #Se utiliza para obtener del Jefe de Educación Continua actual, éste aparece
  #principalmente en los formatos de apertura de grupos del Sistema de
  #Gestión de Calidad, en los historiales acedémicos y en las listas del grupos
  #que tienen el formato del Sistema de Gestión de Calidad.
  def jefe_educacion_continua
    rol = Role.find_by(nombre: "Jefe Educación Continua").id
    usuarios = User.find_by(role: rol).nombre_paterno_materno
  end

  #Se utiliza para filtrar a los alumnos en las listas para calificaciones,
  #las listas del Sistema de Gestión de Calidad, para las constancias y
  #para la lista de usuarios en el sistema.
  def self.alumnos
    rol = Role.find_by(nombre: "Invitado").id
    usuarios = User.where(role: rol)
  end

  #Se utiliza para la lista de instructores en la lista de usuarios del sistema
  #además, se utiliza para la lista de CV de instructores.
  def self.instructores
    rol = Role.find_by(nombre: "Profesor").id
    usuarios = User.where(role: rol)
  end

  def self.nombre_instructores
    rol = Role.find_by(nombre: "Profesor").id
    usuarios = User.where(role: rol)
    usuarios.map { |e| [e.nombre_completo, e.id] }
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
        "(LOWER(users.nombre) LIKE ? OR LOWER(users.paterno) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  scope :with_role_id, lambda { |role_ids|
    # Se filtra a los usuarios dependiendo del role_id dado
    where(role_id: [*role_ids])
  }

end
