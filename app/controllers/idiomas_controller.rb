class IdiomasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idioma, only: [:show, :edit, :update, :destroy]
  before_action :idioma, only: :create
  load_and_authorize_resource

  # GET /idiomas
  # GET /idiomas.json
  def index
    @idiomas = Idioma.all
  end

  # GET /idiomas/1
  # GET /idiomas/1.json
  def show
  end

  # GET /idiomas/new
  def new
    @idioma = Idioma.new
  end

  # GET /idiomas/1/edit
  def edit
  end

  # POST /idiomas
  # POST /idiomas.json
  def create
    @idioma = Idioma.new(idioma_params)

    respond_to do |format|
      if @idioma.save
        format.html { redirect_to @idioma, notice: 'El idioma fue creado correctamente.' }
        format.json { render :show, status: :created, location: @idioma }
      else
        format.html { render :new }
        format.json { render json: @idioma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idiomas/1
  # PATCH/PUT /idiomas/1.json
  def update
    respond_to do |format|
      if @idioma.update(idioma_params)
        format.html { redirect_to @idioma, notice: 'El idioma fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @idioma }
      else
        format.html { render :edit }
        format.json { render json: @idioma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idiomas/1
  # DELETE /idiomas/1.json
  def destroy
    @idioma.destroy
    respond_to do |format|
      format.html { redirect_to idiomas_url, notice: 'El idioma fue actualizado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idioma
      @idioma = Idioma.find(params[:id])
    end

    def idioma
      @idioma = Idioma.new(idioma_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idioma_params
      params.require(:idioma).permit(:idioma)
    end
end
