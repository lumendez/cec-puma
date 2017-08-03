class GruposController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  before_action :set_grupo, only: [:show, :edit, :update, :destroy]
  before_action :grupo, only: :create
  load_and_authorize_resource

  # GET /grupos
  # GET /grupos.json
  def index
    #@grupos = Grupo.all.order("created_at DESC").page params[:pagina]
    @filterrific = initialize_filterrific(
    Grupo,
    params[:filterrific],
    select_options:{
      sorted_by: Grupo.options_for_sorted_by,
      with_curso: CursoNombre.options_for_select,
      with_instructor: User.nombre_instructores
    },
    ) or return
    @grupos = @filterrific.find.order("created_at DESC").page(params[:pagina])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Se tuvieron que restablecer los valores: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  # GET /grupos/1
  # GET /grupos/1.json
  def show
    #Se ordenan alfabéticamente los registros mediante la gema 'sort_alphabetical'
    #@inscripcion_registros = InscripcionRegistro.where(documentos_validados: true, grupo_id: @grupo.id).order('paterno DESC').sort_alphabetical_by(&:paterno)
    @inscripcion_registros = InscripcionRegistro.where(documentos_validados: true, grupo_id: @grupo.id).order('paterno ASC, materno ASC, nombre ASC')
    #Se cuentan los usuarios que se encuentran en cada grupo basados en el id de la inscripcion y la validacion de la documentacion
    @inscritos = InscripcionRegistro.where(documentos_validados: true, grupo_id: @grupo.id).count
  end

  # GET /grupos/new
  def new
    @grupo = Grupo.new
  end

  # GET /grupos/1/edit
  def edit
  end

  # POST /grupos
  # POST /grupos.json
  def create
    @grupo = Grupo.new(grupo_params)

    respond_to do |format|
      if @grupo.save
        format.html { redirect_to grupos_path, notice: 'El grupo fue creado correctamente.' }
        format.json { render :show, status: :created, location: @grupo }
      else
        format.html { render :new }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos/1
  # PATCH/PUT /grupos/1.json
  def update
    respond_to do |format|
      if @grupo.update(grupo_params)
        format.html { redirect_to grupos_path, notice: 'El grupo fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @grupo }
      else
        format.html { render :edit }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos/1
  # DELETE /grupos/1.json
  def destroy
    @grupo.destroy
    respond_to do |format|
      format.html { redirect_to grupos_url, notice: 'El grupo fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    @grupos = Grupo.find(params[:grupo_ids])
  end

  def update_multiple
    @grupos = Grupo.find(params[:grupo_ids])
    @grupos.each do |grupo|
      grupo.update(abrir_grupo_params)
    end
    flash[:notice] = "Grupos abiertos correctamente!"
    redirect_to grupos_path
  end

  def crear_constancias
  @inscripcion_registros = InscripcionRegistro.where(documentos_validados: true, grupo_id: @grupo.id).order('paterno DESC').sort_alphabetical_by(&:paterno)
  end

  def calificaciones
    @inscripcion_registros = InscripcionRegistro.where(documentos_validados: true).order('paterno DESC').sort_alphabetical_by(&:paterno)
  end

  def apertura
  end

  def lista_asistencia
    @inscripcion_registros = InscripcionRegistro.where(documentos_validados: true).order('paterno DESC').sort_alphabetical_by(&:paterno)
  end

  def habilitar_constancias
    if @inscripcion_registro.update(habiliar_constancias_params)
      format.html { redirect_to @inscripcion_registro, notice: 'Se han habilitado las constancias para este grupo.' }
      format.json { render :show, status: :ok, location: @inscripcion_registro }
    else
      format.html { render :edit }
      format.json { render json: @inscripcion_registro.errors, status: :unprocessable_entity }
    end
  end

  def supervisar
  end

  def asignar_calificaciones
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @grupo = Grupo.find(params[:id])
    end

    def grupo
      @grupo = Grupo.new(grupo_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_params
      params.require(:grupo).permit(:nombre, :horario, :idioma, :nivel, :user_id, :estado, :curso, :anio, :periodo, :lugar, :fecha, :centro, :tipo, :modalidad, :cupo, :duracion, :cuota,
       :clave, :proyecto, :institucion_bancaria, :cuenta, :titular, :instructor, :instructor_rfc, :instructor_correo, :jefe_ec, :registro, :referencia, :habilitar_constancias_grupo)
    end

    def abrir_grupo_params
      params.require(:grupo).permit(:estado, :habilitar_constancias_grupo)
    end

    def habilitar_constancias_params
      params.require(:grupo).permit(:habilitar_constancias_grupo)
    end
end
