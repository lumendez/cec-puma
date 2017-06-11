class CalendariosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calendario, only: [:show, :edit, :update, :destroy]
  before_action :calendario, only: :create
  load_and_authorize_resource


  # GET /calendarios
  # GET /calendarios.json
  def index
    @filterrific = initialize_filterrific(
    Calendario,
    params[:filterrific],
    select_options:{
      sorted_by: Calendario.options_for_sorted_by
    },
    ) or return
    @calendarios = @filterrific.find.order("created_at").page(params[:pagina])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Se tuvieron que restablecer los valores: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  # GET /calendarios/1
  # GET /calendarios/1.json
  def show
    @grupos = Grupo.where(curso: @calendario.nombre)
    #@inscripciones = InscripcionRegistro.group(:curso, :grupo_id).count
    #@grupos_total = Grupo.joins(:inscripcion_registros).count
    #@inscritos = InscripcionRegistro.where(documentos_validados: true, grupo_id: @grupo.id).count
  end

  # GET /calendarios/new
  def new
    @calendario = Calendario.new
  end

  # GET /calendarios/1/edit
  def edit
  end

  # POST /calendarios
  # POST /calendarios.json
  def create
    @calendario = Calendario.new(calendario_params)

    respond_to do |format|
      if @calendario.save
        format.html { redirect_to calendarios_path, notice: 'El calendario se creó correctamente.' }
        format.json { render :show, status: :created, location: @calendario }
      else
        format.html { render :new }
        format.json { render json: @calendario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendarios/1
  # PATCH/PUT /calendarios/1.json
  def update
    respond_to do |format|
      if @calendario.update(calendario_params)
        format.html { redirect_to calendarios_path, notice: 'El calendario se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @calendario }
      else
        format.html { render :edit }
        format.json { render json: @calendario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendarios/1
  # DELETE /calendarios/1.json
  def destroy
    @calendario.destroy
    respond_to do |format|
      format.html { redirect_to calendarios_url, notice: 'El calendario se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendario
      @calendario = Calendario.find(params[:id])
    end

    def calendario
      @calendario = Calendario.new(calendario_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendario_params
      params.require(:calendario).permit(:nombre, :registro, :examen_colocacion, :inicio_curso, :examen_medio, :examen_final, :entrega_boletas, :suspension_labores, :vacaciones, :periodo, :anio, :estado)
    end
end
