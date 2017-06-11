class NumeroRegistrosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_numero_registro, only: [:show, :edit, :update, :destroy]
  before_action :numero_registro, only: :create
  load_and_authorize_resource

  # GET /numero_registros
  # GET /numero_registros.json
  def index
    @numero_registros = NumeroRegistro.all
  end

  # GET /numero_registros/1
  # GET /numero_registros/1.json
  def show
  end

  # GET /numero_registros/new
  def new
    @numero_registro = NumeroRegistro.new
  end

  # GET /numero_registros/1/edit
  def edit
  end

  # POST /numero_registros
  # POST /numero_registros.json
  def create
    @numero_registro = NumeroRegistro.new(numero_registro_params)

    respond_to do |format|
      if @numero_registro.save
        format.html { redirect_to @numero_registro, notice: 'El número de registro fue creado correctamente.' }
        format.json { render :show, status: :created, location: @numero_registro }
      else
        format.html { render :new }
        format.json { render json: @numero_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /numero_registros/1
  # PATCH/PUT /numero_registros/1.json
  def update
    respond_to do |format|
      if @numero_registro.update(numero_registro_params)
        format.html { redirect_to @numero_registro, notice: 'El número de registro fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @numero_registro }
      else
        format.html { render :edit }
        format.json { render json: @numero_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numero_registros/1
  # DELETE /numero_registros/1.json
  def destroy
    @numero_registro.destroy
    respond_to do |format|
      format.html { redirect_to numero_registros_url, notice: 'El número de registro fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_numero_registro
      @numero_registro = NumeroRegistro.find(params[:id])
    end

    def numero_registro
      @numero_registro = NumeroRegistro.new(numero_registro_params)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def numero_registro_params
      params.require(:numero_registro).permit(:nombre)
    end
end
