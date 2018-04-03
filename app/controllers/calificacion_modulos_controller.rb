class CalificacionModulosController < ApplicationController

  def actualizar_calificaciones
    CalificacionModulo.update(params[:calificaciones].keys, params[:calificaciones].values)
    flash[:notice] = "Calificaciones guardadas"
    if current_user.role.nombre == "Instructor diplomados"
      redirect_to panel_instructor_diplomados_path
    end
  end

end
