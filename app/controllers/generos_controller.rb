class GenerosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_genero, only: [:show, :edit, :update, :destroy]
  before_action :genero, only: :create
  load_and_authorize_resource

  # GET /generos
  # GET /generos.json
  def index
    @generos = Genero.all
  end

  # GET /generos/1
  # GET /generos/1.json
  def show
  end

  # GET /generos/new
  def new
    @genero = Genero.new
  end

  # GET /generos/1/edit
  def edit
  end

  # POST /generos
  # POST /generos.json
  def create
    @genero = Genero.new(genero_params)

    respond_to do |format|
      if @genero.save
        format.html { redirect_to @genero, notice: 'El género fue creado correctamente.' }
        format.json { render :show, status: :created, location: @genero }
      else
        format.html { render :new }
        format.json { render json: @genero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generos/1
  # PATCH/PUT /generos/1.json
  def update
    respond_to do |format|
      if @genero.update(genero_params)
        format.html { redirect_to @genero, notice: 'El género fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @genero }
      else
        format.html { render :edit }
        format.json { render json: @genero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generos/1
  # DELETE /generos/1.json
  def destroy
    @genero.destroy
    respond_to do |format|
      format.html { redirect_to generos_url, notice: 'El género fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genero
      @genero = Genero.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genero_params
      params.require(:genero).permit(:genero)
    end
end
