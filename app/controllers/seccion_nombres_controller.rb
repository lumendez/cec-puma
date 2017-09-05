class SeccionNombresController < ApplicationController
  before_action :set_seccion_nombre, only: [:show, :edit, :update, :destroy]

  # GET /seccion_nombres
  # GET /seccion_nombres.json
  def index
    @seccion_nombres = SeccionNombre.all
  end

  # GET /seccion_nombres/1
  # GET /seccion_nombres/1.json
  def show
  end

  # GET /seccion_nombres/new
  def new
    @seccion_nombre = SeccionNombre.new
  end

  # GET /seccion_nombres/1/edit
  def edit
  end

  # POST /seccion_nombres
  # POST /seccion_nombres.json
  def create
    @seccion_nombre = SeccionNombre.new(seccion_nombre_params)

    respond_to do |format|
      if @seccion_nombre.save
        format.html { redirect_to @seccion_nombre, notice: 'Seccion nombre was successfully created.' }
        format.json { render :show, status: :created, location: @seccion_nombre }
      else
        format.html { render :new }
        format.json { render json: @seccion_nombre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seccion_nombres/1
  # PATCH/PUT /seccion_nombres/1.json
  def update
    respond_to do |format|
      if @seccion_nombre.update(seccion_nombre_params)
        format.html { redirect_to @seccion_nombre, notice: 'Seccion nombre was successfully updated.' }
        format.json { render :show, status: :ok, location: @seccion_nombre }
      else
        format.html { render :edit }
        format.json { render json: @seccion_nombre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seccion_nombres/1
  # DELETE /seccion_nombres/1.json
  def destroy
    @seccion_nombre.destroy
    respond_to do |format|
      format.html { redirect_to seccion_nombres_url, notice: 'Seccion nombre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seccion_nombre
      @seccion_nombre = SeccionNombre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seccion_nombre_params
      params.require(:seccion_nombre).permit(:nombre)
    end
end
