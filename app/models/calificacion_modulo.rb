class CalificacionModulo < ApplicationRecord
  belongs_to :inscripcion_diplomado, optional:true

  def self.promedio(alumno)
    calificaciones = self.where(inscripcion_diplomado_id: alumno).pluck(:calificacion).map(&:to_i)
    promedio = calificaciones.sum / calificaciones.count
  end

  def self.promedio_asistencia(alumno)
    asistencia = self.where(inscripcion_diplomado_id: alumno).pluck(:asistencia).map(&:to_i)
    promedio = asistencia.sum / asistencia.count
  end

  def self.promedio_texto(alumno)
    calificaciones = self.where(inscripcion_diplomado_id: alumno).pluck(:calificacion).map(&:to_i)
    promedio = calificaciones.sum / calificaciones.count
    
    if promedio == 80
      "OCHENTA"
    elsif promedio == 81
      "OCHENTA Y UNO"
    elsif promedio == 82
      "OCHENTA Y DOS"
    elsif promedio == 83
      "OCHENTA Y TRES"
    elsif promedio == 84
      "OCHENTA Y CUATRO"
    elsif promedio == 85
      "OCHENTA Y CINCO"
    elsif promedio == 86
      "OCHENTA Y SEIS"
    elsif promedio == 87
      "OCHENTA Y SIETE"
    elsif promedio == 88
      "OCHENTA Y OCHO"
    elsif promedio == 89
      "OCHENTA Y NUEVE"
    elsif promedio == 90
      "NOVENTA"
    elsif promedio == 91
      "NOVENTA Y UNO"
    elsif promedio == 92
      "NOVENTA Y DOS"
    elsif promedio == 93
      "NOVENTA Y TRES"
    elsif promedio == 94
      "NOVENTA Y CUATRO"
    elsif promedio == 95
      "NOVENTA Y CINCO"
    elsif promedio == 96
      "NOVENTA Y SEIS"
    elsif promedio == 97
      "NOVENTA Y SIETE"
    elsif promedio == 98
      "NOVENTA Y OCHO"
    elsif promedio == 99
      "NOVENTA Y NUEVE"
    elsif promedio == 100
      "CIEN"
    end
  end

end
