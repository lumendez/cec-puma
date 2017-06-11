class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "¡No tiene autorización para esta acción!"
    #redirect_to root_url
    if current_user.role.nombre == 'Invitado'
      redirect_to panel_alumnos_path
    elsif current_user.role.nombre == 'Profesor'
      redirect_to panel_profesores_path
    elsif current_user.role.nombre == 'Control escolar'
      redirect_to inscripcion_registros_path
    else
      redirect_to inscripcion_registros_path
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.role.nombre == 'Invitado'
      panel_alumnos_path
    elsif current_user.role.nombre == 'Profesor'
      panel_profesores_path
    elsif current_user.role.nombre == 'Control escolar'
      inscripcion_registros_path
    elsif current_user.role.nombre == 'Administrador'
      inscripcion_registros_path
    elsif current_user.role.nombre == 'Coordinación CELEX'
      inscripcion_registros_path
    end
  end

end
