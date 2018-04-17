class GruposDiplomadosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grupos_diplomado, only: [:show, :edit, :update, :destroy, :acta]
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

  # Los siguientes datos se utilizan para imprimir el "Acta Integral de Evaluación
  # de Diplomados para el Personal del IPN"
  def acta
    @modulos = ModuloDiplomado.where(diplomado_id: @grupos_diplomado.diplomado_id)

    @alumnos = InscripcionDiplomado.where(diplomado_id: @grupos_diplomado.diplomado_id)

    alumnos_ids = @alumnos.pluck(:id)

    @calificaciones = CalificacionModulo.where(inscripcion_diplomado_id: alumnos_ids)

    @hombres = InscripcionDiplomado.where(grupos_diplomado_id: @grupos_diplomado,
    sexo:"Masculino", documentos_validados: true).count

    @mujeres = InscripcionDiplomado.where(grupos_diplomado_id: @grupos_diplomado,
    sexo:"Femenino", documentos_validados: true).count

    @hombres_acreditados = 0

    @mujeres_acreditadas = 0

    @alumnos.each do |alumno|
      promedio = CalificacionModulo.promedio(alumno.id)
      if alumno.sexo == "Masculino" && promedio >= 8.00
        @hombres_acreditados = @hombres_acreditados + 1
      elsif alumno.sexo == "Femenino" && promedio >= 8.00
        @mujeres_acreditadas = @mujeres_acreditadas + 1
      end
    end

    respond_to do |format|
      format.pdf do
      render pdf: "Acta",
      disposition: "attachment",
      orientation: "Landscape",
      template: "grupos_diplomados/acta.html.erb",
      layout: "acta_pdf.html.erb"
     end
    end

  end

  def lista_dec
    @modulos = ModuloDiplomado.where(diplomado_id: @grupos_diplomado.diplomado_id)
    @alumnos = InscripcionDiplomado.where(diplomado_id: @grupos_diplomado.diplomado_id)
    alumnos_ids = @alumnos.pluck(:id)
    @calificaciones = CalificacionModulo.where(inscripcion_diplomado_id: alumnos_ids)
    @hombres = InscripcionDiplomado.where(grupos_diplomado_id: @grupos_diplomado,
    sexo:"Masculino", documentos_validados: true).count
    @mujeres = InscripcionDiplomado.where(grupos_diplomado_id: @grupos_diplomado,
    sexo:"Femenino", documentos_validados: true).count
    @hombres_acreditados = 0
    @mujeres_acreditadas = 0
    @alumnos.each do |alumno|
      promedio = CalificacionModulo.promedio(alumno.id)
      if alumno.sexo == "Masculino" && promedio >= 80
        @hombres_acreditados = @hombres_acreditados + 1
      elsif alumno.sexo == "Femenino" && promedio >= 80
        @mujeres_acreditadas = @mujeres_acreditadas + 1
      end
    end
    instructores = ModuloDiplomado.where(diplomado_id: @grupos_diplomado.diplomado_id).pluck(:instructor_id).uniq
    @nombre_instructores = User.where(id: instructores)
    total_acreditados = (@hombres_acreditados + @mujeres_acreditadas)/(@hombres + @mujeres)
    @porcentaje_acreditados = total_acreditados * 100

    respond_to do |format|
      format.pdf do
      render pdf: "Lista de asistencia y calificaciones",
      disposition: "attachment",
      orientation: "Landscape",
      template: "grupos_diplomados/lista_dec.html.erb",
      layout: "acta_pdf.html.erb"
     end
    end

  end

  def lista_cec
    @modulos = ModuloDiplomado.where(diplomado_id: @grupos_diplomado.diplomado_id)
    @alumnos = InscripcionDiplomado.where(diplomado_id: @grupos_diplomado.diplomado_id)
    alumnos_ids = @alumnos.pluck(:id)
    @calificaciones = CalificacionModulo.where(inscripcion_diplomado_id: alumnos_ids)
    respond_to do |format|
      format.pdf do
      render pdf: "Lista CEC",
      disposition: "attachment",
      orientation: "Landscape",
      template: "grupos_diplomados/lista_cec.html.erb",
      layout: "acta_pdf.html.erb"
     end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupos_diplomado
      @grupos_diplomado = GruposDiplomado.find(params[:id])
    end

    def grupos_diplomado
      @grupos_diplomado = GruposDiplomado.new(grupos_diplomado_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupos_diplomado_params
      params.require(:grupos_diplomado).permit(:nombre, :diplomado_id, :horario, :estado, :anio, :inicio, :termino,
      :horario, :lugar, :fecha, :tipo, :modalidad, :cupo, :duracion, :cuota, :clave, :proyecto,
      :institucion_bancaria, :cuenta, :titular, :jefe_ec, :registro, :referencia, :habilitar_constancias,
      :numero_modulos)
    end
end
