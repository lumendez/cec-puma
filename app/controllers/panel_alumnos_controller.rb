class PanelAlumnosController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :panel_alumnos
  def index
    @inscripcion_registros = InscripcionRegistro.where("user_id = ?", current_user.id )
    @fr_inscripcion_registros = FrInscripcionRegistro.where("user_id = ?", current_user.id )
    @it_inscripcion_registros = ItInscripcionRegistro.where("user_id = ?", current_user.id )
    @examen_colocacion_idiomas = ExamenColocacionIdioma.where("user_id = ?", current_user.id )
    @cuota_ipn = CuotaCurso.find_by(descripcion: "Cuota IPN").nombre
    @cuota_externos = CuotaCurso.find_by(descripcion: "Cuota externos").nombre
    @cuota_ipn_cert = CuotaCurso.find_by(descripcion: "Certificación IPN").nombre
    @cuota_externos_cert = CuotaCurso.find_by(descripcion: "Certificación externo").nombre
    @examen_ipn = CuotaCurso.find_by(descripcion: "Examen IPN").nombre
    @examen_externos = CuotaCurso.find_by(descripcion: "Examen externo").nombre
  end
end
