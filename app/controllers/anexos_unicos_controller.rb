class AnexosUnicosController < ApplicationController

  #Se obtienen los nombres de los instructores para generar su anexo unico
  def index
      @users = User.instructores.order(:paterno).page params[:pagina]
  end

  def imprimir_anexo_unico
    @grupos = Grupo.where(user_id: params[:user_ids], curso: params[:curso], anio: params[:anio])
    #@grupos = Grupo.find_by(user_id: params[:user_ids])
    #@users = User.find(params[:user_ids])
  end

end
