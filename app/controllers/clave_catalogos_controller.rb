class ClaveCatalogosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clave_catalogo, only: [:show, :edit, :update, :destroy]
  before_action :clave_catalogo, only: :create
  load_and_authorize_resource

  # GET /clave_catalogos
  # GET /clave_catalogos.json
  def index
    @clave_catalogos = ClaveCatalogo.all
  end

  # GET /clave_catalogos/1
  # GET /clave_catalogos/1.json
  def show
  end

  # GET /clave_catalogos/new
  def new
    @clave_catalogo = ClaveCatalogo.new
  end

  # GET /clave_catalogos/1/edit
  def edit
  end

  # POST /clave_catalogos
  # POST /clave_catalogos.json
  def create
    @clave_catalogo = ClaveCatalogo.new(clave_catalogo_params)

    respond_to do |format|
      if @clave_catalogo.save
        format.html { redirect_to @clave_catalogo, notice: 'La clave de catálogo se creó correctamente.' }
        format.json { render :show, status: :created, location: @clave_catalogo }
      else
        format.html { render :new }
        format.json { render json: @clave_catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clave_catalogos/1
  # PATCH/PUT /clave_catalogos/1.json
  def update
    respond_to do |format|
      if @clave_catalogo.update(clave_catalogo_params)
        format.html { redirect_to @clave_catalogo, notice: 'La clave de catálogo se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @clave_catalogo }
      else
        format.html { render :edit }
        format.json { render json: @clave_catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clave_catalogos/1
  # DELETE /clave_catalogos/1.json
  def destroy
    @clave_catalogo.destroy
    respond_to do |format|
      format.html { redirect_to clave_catalogos_url, notice: 'La clave de catálogo se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clave_catalogo
      @clave_catalogo = ClaveCatalogo.find(params[:id])
    end

    def clave_catalogo
      @clave_catalogo = ClaveCatalogo.new(clave_catalogo_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clave_catalogo_params
      params.require(:clave_catalogo).permit(:nombre)
    end
end
