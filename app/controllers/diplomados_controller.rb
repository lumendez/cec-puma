class DiplomadosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diplomado, only: [:show, :edit, :update, :destroy]
  before_action :diplomado, only: :create
  load_and_authorize_resource

  # GET /diplomados
  # GET /diplomados.json
  def index
    @diplomados = Diplomado.all
  end

  # GET /diplomados/1
  # GET /diplomados/1.json
  def show
    @modulos = ModuloDiplomado.where(diplomado_id: @diplomado.id)
  end

  # GET /diplomados/new
  def new
    @diplomado = Diplomado.new
  end

  # GET /diplomados/1/edit
  def edit
  end

  # POST /diplomados
  # POST /diplomados.json
  def create
    @diplomado = Diplomado.new(diplomado_params)

    respond_to do |format|
      if @diplomado.save
        format.html { redirect_to @diplomado, notice: 'Los datos del diplomado se crearon correctamente.' }
        format.json { render :show, status: :created, location: @diplomado }
      else
        format.html { render :new }
        format.json { render json: @diplomado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diplomados/1
  # PATCH/PUT /diplomados/1.json
  def update
    respond_to do |format|
      if @diplomado.update(diplomado_params)
        format.html { redirect_to @diplomado, notice: 'Los datos del diplomado se actualizaron correctamente.' }
        format.json { render :show, status: :ok, location: @diplomado }
      else
        format.html { render :edit }
        format.json { render json: @diplomado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diplomados/1
  # DELETE /diplomados/1.json
  def destroy
    @diplomado.destroy
    respond_to do |format|
      format.html { redirect_to diplomados_url, notice: 'El diplomado se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diplomado
      @diplomado = Diplomado.find(params[:id])
    end

    def diplomado
      @diplomado = Diplomado.new(diplomado_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diplomado_params
      params.require(:diplomado).permit(:nombre, :dependencia, :sede, :registro, :inicio, :termino, :horario, :estado,
      modulo_diplomados_attributes: ModuloDiplomado.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
