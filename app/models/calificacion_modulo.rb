class CalificacionModulo < ApplicationRecord
  belongs_to :inscripcion_diplomado, optional:true

  def self.promedio(alumno)
    calificaciones = self.where(inscripcion_diplomado_id: alumno).pluck(:calificacion).map(&:to_i)
    promedio = calificaciones.sum.to_f / calificaciones.count.to_f
  end

end
