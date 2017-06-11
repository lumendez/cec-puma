class NivelNombresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_nivel_nombre, only: [:show, :edit, :update, :destroy]
  before_action :nivel_nombre, only: :create
  load_and_authorize_resource

  # GET /nivel_nombres
  # GET /nivel_nombres.json
  def index
    @nivel_nombres = NivelNombre.all
  end

  # GET /nivel_nombres/1
  # GET /nivel_nombres/1.json
  def show
  end

  # GET /nivel_nombres/new
  def new
    @nivel_nombre = NivelNombre.new
  end

  # GET /nivel_nombres/1/edit
  def edit
  end

  # POST /nivel_nombres
  # POST /nivel_nombres.json
  def create
    @nivel_nombre = NivelNombre.new(nivel_nombre_params)

    respond_to do |format|
      if @nivel_nombre.save
        format.html { redirect_to @nivel_nombre, notice: 'El nombre del nivel fue creado correctamente.' }
        format.json { render :show, status: :created, location: @nivel_nombre }
      else
        format.html { render :new }
        format.json { render json: @nivel_nombre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nivel_nombres/1
  # PATCH/PUT /nivel_nombres/1.json
  def update
    respond_to do |format|
      if @nivel_nombre.update(nivel_nombre_params)
        format.html { redirect_to @nivel_nombre, notice: 'El nombre del nivel fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @nivel_nombre }
      else
        format.html { render :edit }
        format.json { render json: @nivel_nombre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nivel_nombres/1
  # DELETE /nivel_nombres/1.json
  def destroy
    @nivel_nombre.destroy
    respond_to do |format|
      format.html { redirect_to nivel_nombres_url, notice: 'El nombre del nivel fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nivel_nombre
      @nivel_nombre = NivelNombre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nivel_nombre_params
      params.require(:nivel_nombre).permit(:nivel)
    end
end
