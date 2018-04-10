class PanelInstructorDiplomadosController < ApplicationController

  def index
    # Se agrupan los ids de las inscripciones (:inscripcion_diplomado_id)a los
    # diplomados basados en la calificacion de los modiulos que tenga que evaluar
    # el instructor.
    inscripcion_ids = CalificacionModulo.joins(:inscripcion_diplomado).where(
    instructor_id: current_user.id).pluck(:inscripcion_diplomado_id)

    # Se identifica el id del diplomado al que pertenecen las inscripciones de
    # diplomado recuperadas en "inscripcion_ids".
    diplomados = InscripcionDiplomado.where(id: inscripcion_ids).pluck(:diplomado_id)

    # Se obtiene el nombre del diplomado a partir del id obtenido en "diplomados".
    @nombres_diplomado = Diplomado.where(id: diplomados)
  end

  def calificacion_diplomados

    # Se agrupan los ids de las inscripciones (:inscripcion_diplomado_id)a los
    # diplomados basados en la calificacion de los modiulos que tenga que evaluar
    # el instructor.
    inscripcion_ids = CalificacionModulo.joins(:inscripcion_diplomado).where(
    instructor_id: current_user.id).pluck(:inscripcion_diplomado_id)

    # Se recuperan todos los registros de inscripción basados en los ids de
    # "inscripcion_ids".
    @usuarios = InscripcionDiplomado.where(id: inscripcion_ids)

    # Se obtiene el id del diplomado a partir del primer registro de inscripcion
    # de diplomado en "@usuarios".
    diplomado = @usuarios.first.diplomado_id

    # Se obtiene el nombre del diplomado a partir del id "diplomado" que se
    # obtuvo con anterioridad.
    @nombre_diplomado = Diplomado.find(diplomado).nombre

    # Se obtienen todos los ids de los modulos de calificacion que tengan el id
    # del usuario actual, en este caso, del instructor que esté "loggeado".
    instructor_ids = CalificacionModulo.joins(:inscripcion_diplomado).where(
    instructor_id: current_user.id).pluck(:instructor_id)

    # Se recuperan los modulos del instructor para editar las calificaiciones de
    # los usuarios.
    @calificacion_modulos = CalificacionModulo.where(instructor_id: instructor_ids)
  end

end
