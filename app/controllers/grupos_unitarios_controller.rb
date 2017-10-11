class GruposUnitariosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grupos_unitario, only: [:show, :edit, :update, :destroy]
  before_action :grupos_unitario, only: :create
  load_and_authorize_resource

  # GET /grupos_unitarios
  # GET /grupos_unitarios.json
  def index
    @grupos_unitarios = GruposUnitario.all
  end

  # GET /grupos_unitarios/1
  # GET /grupos_unitarios/1.json
  def show
    @unitarios = Unitario.where(documentos_validados: true, grupos_unitario_id: @grupos_unitario.id).order('paterno ASC, materno ASC, nombre ASC')
    @inscritos = Unitario.where(documentos_validados: true, grupos_unitario_id: @grupos_unitario.id).count
  end

  # GET /grupos_unitarios/new
  def new
    @grupos_unitario = GruposUnitario.new
  end

  # GET /grupos_unitarios/1/edit
  def edit
  end

  # POST /grupos_unitarios
  # POST /grupos_unitarios.json
  def create
    @grupos_unitario = GruposUnitario.new(grupos_unitario_params)

    respond_to do |format|
      if @grupos_unitario.save
        format.html { redirect_to @grupos_unitario, notice: 'El grupo se creó correctamente.' }
        format.json { render :show, status: :created, location: @grupos_unitario }
      else
        format.html { render :new }
        format.json { render json: @grupos_unitario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos_unitarios/1
  # PATCH/PUT /grupos_unitarios/1.json
  def update
    respond_to do |format|
      if @grupos_unitario.update(grupos_unitario_params)
        format.html { redirect_to @grupos_unitario, notice: 'El grupo se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @grupos_unitario }
      else
        format.html { render :edit }
        format.json { render json: @grupos_unitario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos_unitarios/1
  # DELETE /grupos_unitarios/1.json
  def destroy
    if @grupos_unitario.unitarios.any?
      redirect_to grupos_unitarios_path, alert: 'El grupo que intenta eliminar no está vacío. Primero mueva los registros a otro grupo o elimínelos.'
    else
      @grupos_unitario.destroy
      respond_to do |format|
        format.html { redirect_to grupos_unitarios_url, notice: 'El grupo se eliminó correctamente.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupos_unitario
      @grupos_unitario = GruposUnitario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupos_unitario_params
      params.require(:grupos_unitario).permit(:nombre, :horario, :estado, :anio,
      :periodo, :lugar, :fecha, :centro, :tipo, :modalidad, :cupo, :duracion, :cuota, :clave,
      :proyecto, :institucion_bancaria, :cuenta, :titular, :jefe_ec, :registro, :referencia,
      :habilitar_constancias_grupo)
    end
end
