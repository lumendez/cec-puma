class UnitariosController < ApplicationController
  before_action :set_unitario, only: [:show, :edit, :update, :destroy]

  # GET /unitarios
  # GET /unitarios.json
  def index
    @unitarios = Unitario.all
  end

  # GET /unitarios/1
  # GET /unitarios/1.json
  def show
  end

  # GET /unitarios/new
  def new
    @unitario = Unitario.new
  end

  # GET /unitarios/1/edit
  def edit
  end

  # POST /unitarios
  # POST /unitarios.json
  def create
    @unitario = Unitario.new(unitario_params)

    respond_to do |format|
      if @unitario.save
        format.html { redirect_to @unitario, notice: 'Su registro se creó correctamente.' }
        format.json { render :show, status: :created, location: @unitario }
      else
        format.html { render :new }
        format.json { render json: @unitario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unitarios/1
  # PATCH/PUT /unitarios/1.json
  def update
    respond_to do |format|
      if @unitario.update(unitario_params)
        format.html { redirect_to @unitario, notice: 'Los datos del registro se actualizaron correctamente.' }
        format.json { render :show, status: :ok, location: @unitario }
      else
        format.html { render :edit }
        format.json { render json: @unitario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unitarios/1
  # DELETE /unitarios/1.json
  def destroy
    @unitario.destroy
    respond_to do |format|
      format.html { redirect_to unitarios_url, notice: 'El registro se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unitario
      @unitario = Unitario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unitario_params
      params.require(:unitario).permit(:curp, :nombre, :paterno, :materno, :sexo, :nacimiento, :domicilio, :codigo_postal, :entidad, :delegacion_municipio, :telefono_celular, :telefono_fijo, :correo, :procedencia, :nombre_padre, :correo_padre, :telefono_padre)
    end
end
