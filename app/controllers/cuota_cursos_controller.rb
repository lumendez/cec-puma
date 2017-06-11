class CuotaCursosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cuota_curso, only: [:show, :edit, :update, :destroy]
  before_action :cuota_curso, only: :create
  load_and_authorize_resource

  # GET /cuota_cursos
  # GET /cuota_cursos.json
  def index
    @cuota_cursos = CuotaCurso.all
  end

  # GET /cuota_cursos/1
  # GET /cuota_cursos/1.json
  def show
  end

  # GET /cuota_cursos/new
  def new
    @cuota_curso = CuotaCurso.new
  end

  # GET /cuota_cursos/1/edit
  def edit
  end

  # POST /cuota_cursos
  # POST /cuota_cursos.json
  def create
    @cuota_curso = CuotaCurso.new(cuota_curso_params)

    respond_to do |format|
      if @cuota_curso.save
        format.html { redirect_to @cuota_curso, notice: 'La cuota del curso se creó correctamente.' }
        format.json { render :show, status: :created, location: @cuota_curso }
      else
        format.html { render :new }
        format.json { render json: @cuota_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuota_cursos/1
  # PATCH/PUT /cuota_cursos/1.json
  def update
    respond_to do |format|
      if @cuota_curso.update(cuota_curso_params)
        format.html { redirect_to @cuota_curso, notice: 'La cuota del curso se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @cuota_curso }
      else
        format.html { render :edit }
        format.json { render json: @cuota_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuota_cursos/1
  # DELETE /cuota_cursos/1.json
  def destroy
    @cuota_curso.destroy
    respond_to do |format|
      format.html { redirect_to cuota_cursos_url, notice: 'La cuota del curso se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuota_curso
      @cuota_curso = CuotaCurso.find(params[:id])
    end

    def cuota_curso
      @cuota_curso = CuotaCurso.new(cuota_curso_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuota_curso_params
      params.require(:cuota_curso).permit(:nombre, :descripcion)
    end
end
