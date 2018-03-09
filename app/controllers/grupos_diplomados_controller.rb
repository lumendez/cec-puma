class GruposDiplomadosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grupos_diplomado, only: [:show, :edit, :update, :destroy]
  before_action :grupos_diplomado, only: :create
  load_and_authorize_resource

  # GET /grupos_diplomados
  # GET /grupos_diplomados.json
  def index
    @grupos_diplomados = GruposDiplomado.all
  end

  # GET /grupos_diplomados/1
  # GET /grupos_diplomados/1.json
  def show
  end

  # GET /grupos_diplomados/new
  def new
    @grupos_diplomado = GruposDiplomado.new
  end

  # GET /grupos_diplomados/1/edit
  def edit
  end

  # POST /grupos_diplomados
  # POST /grupos_diplomados.json
  def create
    @grupos_diplomado = GruposDiplomado.new(grupos_diplomado_params)

    respond_to do |format|
      if @grupos_diplomado.save
        format.html { redirect_to @grupos_diplomado, notice: 'El grupo se creó correctamente.' }
        format.json { render :show, status: :created, location: @grupos_diplomado }
      else
        format.html { render :new }
        format.json { render json: @grupos_diplomado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos_diplomados/1
  # PATCH/PUT /grupos_diplomados/1.json
  def update
    respond_to do |format|
      if @grupos_diplomado.update(grupos_diplomado_params)
        format.html { redirect_to @grupos_diplomado, notice: 'El grupo se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @grupos_diplomado }
      else
        format.html { render :edit }
        format.json { render json: @grupos_diplomado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos_diplomados/1
  # DELETE /grupos_diplomados/1.json
  def destroy
    @grupos_diplomado.destroy
    respond_to do |format|
      format.html { redirect_to grupos_diplomados_url, notice: 'El grupo se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupos_diplomado
      @grupos_diplomado = GruposDiplomado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupos_diplomado_params
      params.require(:grupos_diplomado).permit(:nombre, :horario, :estado, :anio, :inicio, :termino,
      :horario, :lugar, :fecha, :tipo, :modalidad, :cupo, :duracion, :cuota, :clave, :proyecto,
      :institucion_bancaria, :cuenta, :titular, :jefe_ec, :registro, :referencia, :habilitar_constancias)
    end
end
