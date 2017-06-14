class ModalidadOfertaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_modalidad_ofertum, only: [:show, :edit, :update, :destroy]
  before_action :modalidad_ofertum, only: :create
  load_and_authorize_resource

  # GET /modalidad_oferta
  # GET /modalidad_oferta.json
  def index
    @modalidad_oferta = ModalidadOfertum.all
  end

  # GET /modalidad_oferta/1
  # GET /modalidad_oferta/1.json
  def show
  end

  # GET /modalidad_oferta/new
  def new
    @modalidad_ofertum = ModalidadOfertum.new
  end

  # GET /modalidad_oferta/1/edit
  def edit
  end

  # POST /modalidad_oferta
  # POST /modalidad_oferta.json
  def create
    @modalidad_ofertum = ModalidadOfertum.new(modalidad_ofertum_params)

    respond_to do |format|
      if @modalidad_ofertum.save
        format.html { redirect_to @modalidad_ofertum, notice: 'La modalidad de oferta se creó correctamente.' }
        format.json { render :show, status: :created, location: @modalidad_ofertum }
      else
        format.html { render :new }
        format.json { render json: @modalidad_ofertum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modalidad_oferta/1
  # PATCH/PUT /modalidad_oferta/1.json
  def update
    respond_to do |format|
      if @modalidad_ofertum.update(modalidad_ofertum_params)
        format.html { redirect_to @modalidad_ofertum, notice: 'La modalidad de oferta se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @modalidad_ofertum }
      else
        format.html { render :edit }
        format.json { render json: @modalidad_ofertum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modalidad_oferta/1
  # DELETE /modalidad_oferta/1.json
  def destroy
    @modalidad_ofertum.destroy
    respond_to do |format|
      format.html { redirect_to modalidad_oferta_url, notice: 'La modalidad de oferta se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modalidad_ofertum
      @modalidad_ofertum = ModalidadOfertum.find(params[:id])
    end

    def modalidad_ofertum
      @modalidad_ofertum = ModalidadOfertum.new(modalidad_ofertum_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modalidad_ofertum_params
      params.require(:modalidad_ofertum).permit(:nombre)
    end
end
