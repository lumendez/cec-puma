class ProcedenciaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_procedencium, only: [:show, :edit, :update, :destroy]
  before_action :procedencium, only: :create
  load_and_authorize_resource

  # GET /procedencia
  # GET /procedencia.json
  def index
    @procedencia = Procedencium.all
  end

  # GET /procedencia/1
  # GET /procedencia/1.json
  def show
  end

  # GET /procedencia/new
  def new
    @procedencium = Procedencium.new
  end

  # GET /procedencia/1/edit
  def edit
  end

  # POST /procedencia
  # POST /procedencia.json
  def create
    @procedencium = Procedencium.new(procedencium_params)

    respond_to do |format|
      if @procedencium.save
        format.html { redirect_to @procedencium, notice: 'La procedencia fue creada correctamente.' }
        format.json { render :show, status: :created, location: @procedencium }
      else
        format.html { render :new }
        format.json { render json: @procedencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procedencia/1
  # PATCH/PUT /procedencia/1.json
  def update
    respond_to do |format|
      if @procedencium.update(procedencium_params)
        format.html { redirect_to @procedencium, notice: 'La procedencia fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @procedencium }
      else
        format.html { render :edit }
        format.json { render json: @procedencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedencia/1
  # DELETE /procedencia/1.json
  def destroy
    @procedencium.destroy
    respond_to do |format|
      format.html { redirect_to procedencia_url, notice: 'La procedencia fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedencium
      @procedencium = Procedencium.find(params[:id])
    end

    def procedencium
      @procedencium = Procedencium.new(procedencium_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procedencium_params
      params.require(:procedencium).permit(:procedencia)
    end
end
