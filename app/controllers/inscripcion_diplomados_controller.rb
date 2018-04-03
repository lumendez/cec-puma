class InscripcionDiplomadosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inscripcion_diplomado, only: [:show, :edit, :update, :destroy]
  before_action :inscripcion_diplomado, only: :create
  load_and_authorize_resource

  # GET /inscripcion_diplomados
  # GET /inscripcion_diplomados.json
  def index
    #@unitarios = Unitario.all
    #@grupos_unitarios = GruposUnitario.all
    @filterrific = initialize_filterrific(
    InscripcionDiplomado,
    params[:filterrific],
    select_options: {
      with_grupos_unitario_id: GruposDiplomado.seleccion_curso_nombre,
      with_documentos_validados: InscripcionDiplomado.options_for_documentos_validados
    },
  ) or return
  @inscripcion_diplomados = @filterrific.find.page(params[:pagina])

  respond_to do |format|
    format.html
    format.js
  end

  rescue ActiveRecord::RecordNotFound => e
  # There is an issue with the persisted param_set. Reset it.
  puts "Se restablecieron los parámetros: #{ e.message }"
  redirect_to(reset_filterrific_url(format: :html)) and return
  end

  # GET /inscripcion_diplomados/1
  # GET /inscripcion_diplomados/1.json
  def show
    @calificacion_modulos = CalificacionModulo.where(inscripcion_diplomado_id: @inscripcion_diplomado.id)
  end

  # GET /inscripcion_diplomados/new
  def new
    @inscripcion_diplomado = InscripcionDiplomado.new
    @calificacion_modulos = []
    #15.times do
      #@calificacion_modulos << CalificacionModulo.new
    #end
  end

  # GET /inscripcion_diplomados/1/edit
  def edit
    @calificacion_modulos = CalificacionModulo.where(inscripcion_diplomado_id: @inscripcion_diplomado.id)
  end

  # POST /inscripcion_diplomados
  # POST /inscripcion_diplomados.json
  def create

    @inscripcion_diplomado = InscripcionDiplomado.new(inscripcion_diplomado_params)
    grupo_id = GruposDiplomado.find_by(diplomado_id: @inscripcion_diplomado.diplomado_id).id
    @inscripcion_diplomado.grupos_diplomado_id = grupo_id
    # Se calcula el número de módulos que tiene el diplomado al que se inscribe
    # el usuario para crear ese mismo número de campos de calificación.
    #modulos = inscripcion_diplomado.grupos_diplomado.numero_modulos
    modulos = ModuloDiplomado.where(diplomado_id: @inscripcion_diplomado.diplomado_id)

    respond_to do |format|
      if @inscripcion_diplomado.save
        # Se guardan al mismo tiempo los datos de la inscripción y el número de
        # espacios de calificación para ese usuario.
        modulos.each do |modulo|
          CalificacionModulo.create(calificacion: "", inscripcion_diplomado_id: @inscripcion_diplomado.id, instructor_id: modulo.instructor_id, numero_modulo: modulo.numero_modulo)
        end
        format.html { redirect_to @inscripcion_diplomado, notice: 'La inscripción al diplomado fue creada correctamente.' }
        format.json { render :show, status: :created, location: @inscripcion_diplomado }
      else
        format.html { render :new }
        format.json { render json: @inscripcion_diplomado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscripcion_diplomados/1
  # PATCH/PUT /inscripcion_diplomados/1.json
  def update
    respond_to do |format|
      if @inscripcion_diplomado.update(inscripcion_diplomado_params)
        # Se guardan las calificaciones para cada uno de los módulos del
        # diplomado
        CalificacionModulo.update(params[:calificaciones].keys, params[:calificaciones].values)
        format.html { redirect_to @inscripcion_diplomado, notice: 'La inscripción al diplomado fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @inscripcion_diplomado }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion_diplomado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscripcion_diplomados/1
  # DELETE /inscripcion_diplomados/1.json
  def destroy
    @inscripcion_diplomado.destroy
    respond_to do |format|
      format.html { redirect_to inscripcion_diplomados_url, notice: 'La inscripción al diplomado fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscripcion_diplomado
      @inscripcion_diplomado = InscripcionDiplomado.find(params[:id])
    end

    def inscripcion_diplomado
      @inscripcion_diplomado = InscripcionDiplomado.new(inscripcion_diplomado_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscripcion_diplomado_params
      params.require(:inscripcion_diplomado).permit(:diplomado_id, :curp, :nombre, :paterno, :materno,
      :sexo, :nacimiento, :domicilio, :codigo_postal, :entidad, :delegacion_municipio,
      :telefono_celular, :telefono_fijo, :correo, :procedencia, :grupos_diplomado_id,
      :documentos_validados, calificacion_modulos_attributes: CalificacionModulo.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
