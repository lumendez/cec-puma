class ReinscripcionRegistrosController < ApplicationController
  
  def boleta
    if params[:noboleta]
      @inscripcion_registros = buscar
    else
      @inscripcion_registros = InscripcionRegistro.all
    end
  end

  def buscar
    @inscripcion_registros = InscripcionRegistro.buscar(params[:noboleta])
  end

end
