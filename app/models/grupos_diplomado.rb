class GruposDiplomado < ApplicationRecord

  def jefe_educacion_continua
    rol = Role.find_by(nombre: "Jefe Educación Continua").id
    usuarios = User.find_by(role: rol).nombre_paterno_materno
  end

  def self.seleccion_curso_nombre
    order('LOWER(nombre)').map { |e| [e.nombre, e.id] }
  end

end
