class CuotaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cuotum, only: [:show, :edit, :update, :destroy]
  before_action :cuotum, only: :create
  load_and_authorize_resource

  # GET /cuota
  # GET /cuota.json
  def index
    @cuota = Cuotum.all
  end

  # GET /cuota/1
  # GET /cuota/1.json
  def show
  end

  # GET /cuota/new
  def new
    @cuotum = Cuotum.new
  end

  # GET /cuota/1/edit
  def edit
  end

  # POST /cuota
  # POST /cuota.json
  def create
    @cuotum = Cuotum.new(cuotum_params)

    respond_to do |format|
      if @cuotum.save
        format.html { redirect_to @cuotum, notice: 'El costo de la cuota fue creado correctamente.' }
        format.json { render :show, status: :created, location: @cuotum }
      else
        format.html { render :new }
        format.json { render json: @cuotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuota/1
  # PATCH/PUT /cuota/1.json
  def update
    respond_to do |format|
      if @cuotum.update(cuotum_params)
        format.html { redirect_to @cuotum, notice: 'El costo de la cuota fue acutlizado correctamente.' }
        format.json { render :show, status: :ok, location: @cuotum }
      else
        format.html { render :edit }
        format.json { render json: @cuotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuota/1
  # DELETE /cuota/1.json
  def destroy
    @cuotum.destroy
    respond_to do |format|
      format.html { redirect_to cuota_url, notice: 'El costo de la cuota fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuotum
      @cuotum = Cuotum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuotum_params
      params.require(:cuotum).permit(:cuota)
    end
end
