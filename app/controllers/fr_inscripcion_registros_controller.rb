class FrInscripcionRegistrosController < ApplicationController
  before_action :set_fr_inscripcion_registro, only: [:show, :edit, :update, :destroy]

  # GET /fr_inscripcion_registros
  # GET /fr_inscripcion_registros.json
  def index
    @fr_inscripcion_registros = FrInscripcionRegistro.all
  end

  # GET /fr_inscripcion_registros/1
  # GET /fr_inscripcion_registros/1.json
  def show
  end

  # GET /fr_inscripcion_registros/new
  def new
    @fr_inscripcion_registro = FrInscripcionRegistro.new
  end

  # GET /fr_inscripcion_registros/1/edit
  def edit
  end

  # POST /fr_inscripcion_registros
  # POST /fr_inscripcion_registros.json
  def create
    @fr_inscripcion_registro = FrInscripcionRegistro.new(fr_inscripcion_registro_params)

    respond_to do |format|
      if @fr_inscripcion_registro.save
        format.html { redirect_to @fr_inscripcion_registro, notice: 'Fr inscripcion registro was successfully created.' }
        format.json { render :show, status: :created, location: @fr_inscripcion_registro }
      else
        format.html { render :new }
        format.json { render json: @fr_inscripcion_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fr_inscripcion_registros/1
  # PATCH/PUT /fr_inscripcion_registros/1.json
  def update
    respond_to do |format|
      if @fr_inscripcion_registro.update(fr_inscripcion_registro_params)
        format.html { redirect_to @fr_inscripcion_registro, notice: 'Fr inscripcion registro was successfully updated.' }
        format.json { render :show, status: :ok, location: @fr_inscripcion_registro }
      else
        format.html { render :edit }
        format.json { render json: @fr_inscripcion_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fr_inscripcion_registros/1
  # DELETE /fr_inscripcion_registros/1.json
  def destroy
    @fr_inscripcion_registro.destroy
    respond_to do |format|
      format.html { redirect_to fr_inscripcion_registros_url, notice: 'Fr inscripcion registro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fr_inscripcion_registro
      @fr_inscripcion_registro = FrInscripcionRegistro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fr_inscripcion_registro_params
      params.require(:fr_inscripcion_registro).permit(:nombre, :paterno, :materno, :idioma, :horario, :nivel, :curso, :opcion_uno, :opcion_dos, :telefono, :periodo, :correo, :sexo, :cuota, :movimiento, :procedencia, :grupo_id, :examen_medio, :examen_final, :documentos_validados, :boleta, :oferta_grupo, :user_id, :habilitar_constancia, :habilitar_historial, :oficio_prestacion, :monto_pagado)
    end
end
