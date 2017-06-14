class TipoOfertaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tipo_ofertum, only: [:show, :edit, :update, :destroy]
  before_action :tipo_ofertum, only: :create
  load_and_authorize_resource

  # GET /tipo_oferta
  # GET /tipo_oferta.json
  def index
    @tipo_oferta = TipoOfertum.all
  end

  # GET /tipo_oferta/1
  # GET /tipo_oferta/1.json
  def show
  end

  # GET /tipo_oferta/new
  def new
    @tipo_ofertum = TipoOfertum.new
  end

  # GET /tipo_oferta/1/edit
  def edit
  end

  # POST /tipo_oferta
  # POST /tipo_oferta.json
  def create
    @tipo_ofertum = TipoOfertum.new(tipo_ofertum_params)

    respond_to do |format|
      if @tipo_ofertum.save
        format.html { redirect_to @tipo_ofertum, notice: 'El tipo de oferta se creó correctamente.' }
        format.json { render :show, status: :created, location: @tipo_ofertum }
      else
        format.html { render :new }
        format.json { render json: @tipo_ofertum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_oferta/1
  # PATCH/PUT /tipo_oferta/1.json
  def update
    respond_to do |format|
      if @tipo_ofertum.update(tipo_ofertum_params)
        format.html { redirect_to @tipo_ofertum, notice: 'El tipo de oferta se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @tipo_ofertum }
      else
        format.html { render :edit }
        format.json { render json: @tipo_ofertum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_oferta/1
  # DELETE /tipo_oferta/1.json
  def destroy
    @tipo_ofertum.destroy
    respond_to do |format|
      format.html { redirect_to tipo_oferta_url, notice: 'El tipo de oferta se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_ofertum
      @tipo_ofertum = TipoOfertum.find(params[:id])
    end

    def role
      @tipo_ofertum = TipoOfertum.new(tipo_ofertum_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_ofertum_params
      params.require(:tipo_ofertum).permit(:nombre)
    end
end
