class DatosBancosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_datos_banco, only: [:show, :edit, :update, :destroy]
  before_action :datos_banco, only: :create
  load_and_authorize_resource

  # GET /datos_bancos
  # GET /datos_bancos.json
  def index
    @datos_bancos = DatosBanco.all
  end

  # GET /datos_bancos/1
  # GET /datos_bancos/1.json
  def show
  end

  # GET /datos_bancos/new
  def new
    @datos_banco = DatosBanco.new
  end

  # GET /datos_bancos/1/edit
  def edit
  end

  # POST /datos_bancos
  # POST /datos_bancos.json
  def create
    @datos_banco = DatosBanco.new(datos_banco_params)

    respond_to do |format|
      if @datos_banco.save
        format.html { redirect_to @datos_banco, notice: 'Los datos de la institución bancaria se crearon correctamente.' }
        format.json { render :show, status: :created, location: @datos_banco }
      else
        format.html { render :new }
        format.json { render json: @datos_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datos_bancos/1
  # PATCH/PUT /datos_bancos/1.json
  def update
    respond_to do |format|
      if @datos_banco.update(datos_banco_params)
        format.html { redirect_to @datos_banco, notice: 'Los datos de la institución bancaria se actualizaron correctamente.' }
        format.json { render :show, status: :ok, location: @datos_banco }
      else
        format.html { render :edit }
        format.json { render json: @datos_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datos_bancos/1
  # DELETE /datos_bancos/1.json
  def destroy
    @datos_banco.destroy
    respond_to do |format|
      format.html { redirect_to datos_bancos_url, notice: 'Los datos de la institución bancaria se eliminaron correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datos_banco
      @datos_banco = DatosBanco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datos_banco_params
      params.require(:datos_banco).permit(:nombre, :cuenta, :referencia, :titular)
    end
end
