class PanelProfesoresController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :panel_profesores

  def index
    @grupos = Grupo.all
  end

  def mis_grupos
    @grupos = Grupo.where("profesor_nombre_id.nombre = ?", current_user.nombre)
    @inscripcion_registros = InscripcionRegistro.where(documentos_validados: true)
  end

  def lista_asistencia
    @inscripcion_registros = InscripcionRegistro.where(documentos_validados: true).order('paterno DESC').sort_alphabetical_by(&:paterno)
  end

end
