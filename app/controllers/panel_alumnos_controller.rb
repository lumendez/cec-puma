class PanelAlumnosController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :panel_alumnos
  def index
    @inscripcion_registros = InscripcionRegistro.where("user_id = ?", current_user.id )
    @examen_colocacion_idiomas = ExamenColocacionIdioma.where("user_id = ?", current_user.id )
  end
end
