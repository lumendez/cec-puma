class CursoNombresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_curso_nombre, only: [:show, :edit, :update, :destroy]
  before_action :curso_nombre, only: :create
  load_and_authorize_resource

  # GET /curso_nombres
  # GET /curso_nombres.json
  def index
    @curso_nombres = CursoNombre.all.order("nombre ASC")
  end

  # GET /curso_nombres/1
  # GET /curso_nombres/1.json
  def show
  end

  # GET /curso_nombres/new
  def new
    @curso_nombre = CursoNombre.new
  end

  # GET /curso_nombres/1/edit
  def edit
  end

  # POST /curso_nombres
  # POST /curso_nombres.json
  def create
    @curso_nombre = CursoNombre.new(curso_nombre_params)

    respond_to do |format|
      if @curso_nombre.save
        format.html { redirect_to @curso_nombre, notice: 'El nombre del curso fue creado correctamente.' }
        format.json { render :show, status: :created, location: @curso_nombre }
      else
        format.html { render :new }
        format.json { render json: @curso_nombre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curso_nombres/1
  # PATCH/PUT /curso_nombres/1.json
  def update
    respond_to do |format|
      if @curso_nombre.update(curso_nombre_params)
        format.html { redirect_to @curso_nombre, notice: 'El nombre del curso fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @curso_nombre }
      else
        format.html { render :edit }
        format.json { render json: @curso_nombre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curso_nombres/1
  # DELETE /curso_nombres/1.json
  def destroy
    @curso_nombre.destroy
    respond_to do |format|
      format.html { redirect_to curso_nombres_url, notice: 'El nombre del curso fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso_nombre
      @curso_nombre = CursoNombre.find(params[:id])
    end

    def curso_nombre
      @curso_nombre = CursoNombre.new(curso_nombre_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_nombre_params
      params.require(:curso_nombre).permit(:nombre)
    end
end
