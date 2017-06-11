class LugarNombresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lugar_nombre, only: [:show, :edit, :update, :destroy]
  before_action :lugar_nombre, only: :create
  load_and_authorize_resource

  # GET /lugar_nombres
  # GET /lugar_nombres.json
  def index
    @lugar_nombres = LugarNombre.all
  end

  # GET /lugar_nombres/1
  # GET /lugar_nombres/1.json
  def show
  end

  # GET /lugar_nombres/new
  def new
    @lugar_nombre = LugarNombre.new
  end

  # GET /lugar_nombres/1/edit
  def edit
  end

  # POST /lugar_nombres
  # POST /lugar_nombres.json
  def create
    @lugar_nombre = LugarNombre.new(lugar_nombre_params)

    respond_to do |format|
      if @lugar_nombre.save
        format.html { redirect_to @lugar_nombre, notice: 'El nombre del lugar de realización se creó correctamente.' }
        format.json { render :show, status: :created, location: @lugar_nombre }
      else
        format.html { render :new }
        format.json { render json: @lugar_nombre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lugar_nombres/1
  # PATCH/PUT /lugar_nombres/1.json
  def update
    respond_to do |format|
      if @lugar_nombre.update(lugar_nombre_params)
        format.html { redirect_to @lugar_nombre, notice: 'El nombre del lugar de realización se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @lugar_nombre }
      else
        format.html { render :edit }
        format.json { render json: @lugar_nombre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lugar_nombres/1
  # DELETE /lugar_nombres/1.json
  def destroy
    @lugar_nombre.destroy
    respond_to do |format|
      format.html { redirect_to lugar_nombres_url, notice: 'El nombre del lugar de realización se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lugar_nombre
      @lugar_nombre = LugarNombre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lugar_nombre_params
      params.require(:lugar_nombre).permit(:nombre)
    end
end
