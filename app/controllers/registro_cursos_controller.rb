class RegistroCursosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_registro_curso, only: [:show, :edit, :update, :destroy]
  before_action :registro_curso, only: :create
  load_and_authorize_resource


  # GET /registro_cursos
  # GET /registro_cursos.json
  def index
    @registro_cursos = RegistroCurso.all
  end

  # GET /registro_cursos/1
  # GET /registro_cursos/1.json
  def show
  end

  # GET /registro_cursos/new
  def new
    @registro_curso = RegistroCurso.new
  end

  # GET /registro_cursos/1/edit
  def edit
  end

  # POST /registro_cursos
  # POST /registro_cursos.json
  def create
    @registro_curso = RegistroCurso.new(registro_curso_params)

    respond_to do |format|
      if @registro_curso.save
        format.html { redirect_to @registro_curso, notice: 'El registro del curso fue creado correctamente.' }
        format.json { render :show, status: :created, location: @registro_curso }
      else
        format.html { render :new }
        format.json { render json: @registro_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registro_cursos/1
  # PATCH/PUT /registro_cursos/1.json
  def update
    respond_to do |format|
      if @registro_curso.update(registro_curso_params)
        format.html { redirect_to @registro_curso, notice: 'El registro del curso fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @registro_curso }
      else
        format.html { render :edit }
        format.json { render json: @registro_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registro_cursos/1
  # DELETE /registro_cursos/1.json
  def destroy
    @registro_curso.destroy
    respond_to do |format|
      format.html { redirect_to registro_cursos_url, notice: 'El registro del curso fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro_curso
      @registro_curso = RegistroCurso.find(params[:id])
    end

    def registro_curso
      @registro_curso = RegistroCurso.new(registro_curso_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_curso_params
      params.require(:registro_curso).permit(:nombre, :horas, :periodo, :temas, :instructor,
      :horario, :registro, :tipo_oferta, :modalidad, :cupo, :cuota, :clave_catalogo)
    end
end
