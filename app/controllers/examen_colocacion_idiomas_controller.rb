class ExamenColocacionIdiomasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_examen_colocacion_idioma, only: [:show, :edit, :update, :destroy]
  before_action :examen_colocacion_idioma, only: :create
  load_and_authorize_resource

  # GET /examen_colocacion_idiomas
  # GET /examen_colocacion_idiomas.json
  def index
    @examen_colocacion_idiomas = ExamenColocacionIdioma.all
  end

  # GET /examen_colocacion_idiomas/1
  # GET /examen_colocacion_idiomas/1.json
  def show
  end

  # GET /examen_colocacion_idiomas/new
  def new
    @examen_colocacion_idioma = current_user.examen_colocacion_idiomas.build
  end

  # GET /examen_colocacion_idiomas/1/edit
  def edit
  end

  # POST /examen_colocacion_idiomas
  # POST /examen_colocacion_idiomas.json
  def create
    @examen_colocacion_idioma = current_user.examen_colocacion_idiomas.build(examen_colocacion_idioma_params)

    #respond_to do |format|
      if @examen_colocacion_idioma.save
        if current_user.role.nombre == "Invitado"
          redirect_to panel_alumnos_path, notice: 'La solicitud de examen se creó correctamente'
        else
        format.html { redirect_to @examen_colocacion_idioma, notice: 'La solicitud de examen de colocación se creó correctamente.' }
        format.json { render :show, status: :created, location: @examen_colocacion_idioma }
        end
      else
        format.html { render :new }
        format.json { render json: @examen_colocacion_idioma.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /examen_colocacion_idiomas/1
  # PATCH/PUT /examen_colocacion_idiomas/1.json
  def update
    respond_to do |format|
      if @examen_colocacion_idioma.update(examen_colocacion_idioma_params)
        format.html { redirect_to @examen_colocacion_idioma, notice: 'La solicitud de examen de colocación se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @examen_colocacion_idioma }
      else
        format.html { render :edit }
        format.json { render json: @examen_colocacion_idioma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examen_colocacion_idiomas/1
  # DELETE /examen_colocacion_idiomas/1.json
  def destroy
    @examen_colocacion_idioma.destroy
    respond_to do |format|
      format.html { redirect_to examen_colocacion_idiomas_url, notice: 'La solicitud de examen de colocación se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  def asignar_nivel
    if @examen_colocacion_idioma.update(examen_colocacion_idioma_params)
      format.html { redirect_to @examen_colocacion_idioma, notice: 'La solicitud de examen de colocación se actualizó correctamente.' }
      format.json { render :show, status: :ok, location: @examen_colocacion_idioma }
    else
      format.html { render :edit }
      format.json { render json: @examen_colocacion_idioma.errors, status: :unprocessable_entity }
    end
  end

  def subir_comprobante
    if @examen_colocacion_idioma.update(subir_comprobante_params)
      format.html { redirect_to @examen_colocacion_idioma, notice: 'La solicitud de examen de colocación se actualizó correctamente.' }
      format.json { render :show, status: :ok, location: @examen_colocacion_idioma }
    else
      format.html { render :edit }
      format.json { render json: @examen_colocacion_idioma.errors, status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_examen_colocacion_idioma
      @examen_colocacion_idioma = ExamenColocacionIdioma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def examen_colocacion_idioma_params
      params.require(:examen_colocacion_idioma).permit(:nombre, :paterno, :materno, :idioma, :nivel_asignado, :examinador, :user_id, :imagen)
    end

    def subir_comprobante_params
      params.require(:examen_colocacion_idioma).permit(:imagen)
    end

    def examen_colocacion_idioma
      @examen_colocacion_idioma = ExamenColocacionIdioma.new(examen_colocacion_idioma_params)
    end

end
