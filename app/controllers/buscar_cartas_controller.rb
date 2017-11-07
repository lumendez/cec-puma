class BuscarCartasController < ApplicationController

  def carta
    if params[:folio_carta]
      buscar
    else
      redirect_to buscar_cartas_path, notice: 'Deberá introducir un número de folio correcto.'
    end
  end

  def buscar
    @unitario = Unitario.buscar(params[:folio_carta])
    if @unitario.present?
      redirect_to @unitario
    else
      redirect_to buscar_cartas_path, notice: 'Debe de introducir un número de folio correcto.'
    end
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
