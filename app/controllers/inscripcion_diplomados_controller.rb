class InscripcionDiplomadosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inscripcion_diplomado, only: [:show, :edit, :update, :destroy]
  before_action :inscripcion_diplomado, only: :create
  load_and_authorize_resource

  # GET /inscripcion_diplomados
  # GET /inscripcion_diplomados.json
  def index
    @inscripcion_diplomados = InscripcionDiplomado.all
  end

  # GET /inscripcion_diplomados/1
  # GET /inscripcion_diplomados/1.json
  def show
    @calificacion_modulos = CalificacionModulo.where(inscripcion_diplomado_id: @inscripcion_diplomado.id)
  end

  # GET /inscripcion_diplomados/new
  def new
    @inscripcion_diplomado = InscripcionDiplomado.new
    @calificacion_modulos = []
    5.times do
      @calificacion_modulos << CalificacionModulo.new
    end
  end

  # GET /inscripcion_diplomados/1/edit
  def edit
    @calificacion_modulos = CalificacionModulo.where(inscripcion_diplomado_id: @inscripcion_diplomado.id)
  end

  # POST /inscripcion_diplomados
  # POST /inscripcion_diplomados.json
  def create

    @inscripcion_diplomado = InscripcionDiplomado.new(inscripcion_diplomado_params)

    respond_to do |format|
      if @inscripcion_diplomado.save
        params["calificaciones"].each do |calificacion|
          CalificacionModulo.create(calificacion: calificacion.values[0], inscripcion_diplomado_id: @inscripcion_diplomado.id)
        end
        format.html { redirect_to @inscripcion_diplomado, notice: 'La inscripción al diplomado fue creada correctamente.' }
        format.json { render :show, status: :created, location: @inscripcion_diplomado }
      else
        format.html { render :new }
        format.json { render json: @inscripcion_diplomado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscripcion_diplomados/1
  # PATCH/PUT /inscripcion_diplomados/1.json
  def update
    respond_to do |format|
      if @inscripcion_diplomado.update(inscripcion_diplomado_params)
        format.html { redirect_to @inscripcion_diplomado, notice: 'La inscripción al diplomado fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @inscripcion_diplomado }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion_diplomado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscripcion_diplomados/1
  # DELETE /inscripcion_diplomados/1.json
  def destroy
    @inscripcion_diplomado.destroy
    respond_to do |format|
      format.html { redirect_to inscripcion_diplomados_url, notice: 'La inscripción al diplomado fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscripcion_diplomado
      @inscripcion_diplomado = InscripcionDiplomado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscripcion_diplomado_params
      params.require(:inscripcion_diplomado).permit(:curp, :nombre, :paterno, :materno,
      :sexo, :nacimiento, :domicilio, :codigo_postal, :entidad, :delegacion_municipio,
      :telefono_celular, :telefono_fijo, :correo, :procedencia, :grupos_diplomado_id,
      :documentos_validados, calificacion_modulos_attributes: CalificacionModulo.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
