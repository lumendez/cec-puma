class AnexosUnicosController < ApplicationController

  #Se obtienen los nombres de los instructores para generar su anexo unico
  def index
      @users = User.instructores.order(:paterno).page params[:pagina]
  end

  def imprimir_anexo_unico
    @instructores = User.where(id: params[:user_ids])
    @curso = CursoNombre.find_by(nombre: params[:curso]).nombre
    @periodo = Grupo.find_by(curso: params[:curso]).periodo
    # Se obtienen los grupos que tiene cada instructor en determinado idioma para
    # enviarlos al formato de impresión
    #@grupos_ingles = Grupo.where(user_id: params[:user_ids], curso: params[:curso], anio: params[:anio], idioma: "Inglés")
    #@frances = Grupo.where(user_id: params[:user_ids], curso: params[:curso], anio: params[:anio], idioma: "Francés")
    #@italiano = Grupo.where(user_id: params[:user_ids], curso: params[:curso], anio: params[:anio], idioma: "Italiano")
    # Se traduce el mes para imprimir la fecha en que se genera el anexo
    @mes = mes
    #@cursos_ingles = cursos_ingles
  end

  def mes
    if Date.today.strftime("%b") == "Jan"
      mes = "Enero"
    elsif Date.today.strftime("%b") == "Feb"
      mes = "Febrero"
    elsif Date.today.strftime("%b") == "Mar"
      mes = "Marzo"
    elsif Date.today.strftime("%b") == "Apr"
      mes = "Abril"
    elsif Date.today.strftime("%b") == "May"
      mes = "Mayo"
    elsif Date.today.strftime("%b") == "Jun"
      mes = "Junio"
    elsif Date.today.strftime("%b") == "Jul"
      mes = "Julio"
    elsif Date.today.strftime("%b") == "Aug"
      mes = "Agosto"
    elsif Date.today.strftime("%b") == "Sep"
      mes = "Septiembre"
    elsif Date.today.strftime("%b") == "Oct"
      mes = "Octubre"
    elsif Date.today.strftime("%b") == "Nov"
      mes = "Noviembre"
    elsif Date.today.strftime("%b") == "Dec"
      mes = "Diciembre"
    end
  end

end
