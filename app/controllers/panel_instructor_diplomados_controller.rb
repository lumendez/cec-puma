class PanelInstructorDiplomadosController < ApplicationController

  def index
    inscripcion_ids = CalificacionModulo.joins(:inscripcion_diplomado).where(
    instructor_id: current_user.id).pluck(:inscripcion_diplomado_id)

    diplomados = InscripcionDiplomado.where(id: inscripcion_ids).pluck(:diplomado_id)
    @nombres_diplomado = Diplomado.where(id: diplomados)
  end

  def calificacion_diplomados
    inscripcion_ids = CalificacionModulo.joins(:inscripcion_diplomado).where(
    instructor_id: current_user.id).pluck(:inscripcion_diplomado_id)

    @usuarios = InscripcionDiplomado.where(id: inscripcion_ids)

    diplomado = @usuarios.first.diplomado_id

    @nombre_diplomado = Diplomado.find(diplomado).nombre

    instructor_ids = CalificacionModulo.joins(:inscripcion_diplomado).where(
    instructor_id: current_user.id).pluck(:instructor_id)

    @calificacion_modulos = CalificacionModulo.where(instructor_id: instructor_ids)
  end

end
