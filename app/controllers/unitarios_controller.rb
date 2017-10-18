class UnitariosController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new, :show]
  before_action :set_unitario, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource

  # GET /unitarios
  # GET /unitarios.json
  def index
    @unitarios = Unitario.all
    @grupos_unitarios = GruposUnitario.all
  end

  # GET /unitarios/1
  # GET /unitarios/1.json
  def show
    @mes = mes
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

    if @unitario.grupos_unitario.nombre.include? "Curso de preparación para el nivel"
      respond_to do |format|
        if @unitario.save
          format.html { redirect_to @unitario, notice: 'Su registro se creó correctamente.' }
          format.json { render :show, status: :created, location: @unitario }
        else
          format.html { render :new }
          format.json { render json: @unitario.errors, status: :unprocessable_entity }
        end
      end

    else

      respond_to do |format|
        if @unitario.save
          format.html { redirect_to root_path, notice: 'Su registro se creó correctamente.' }
          format.json { render :show, status: :created, location: @unitario }
        else
          format.html { render :new }
          format.json { render json: @unitario.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /unitarios/1
  # PATCH/PUT /unitarios/1.json
  def update
    #respond_to do |format|
      if @unitario.update(unitario_params)
        if user_signed_in? && current_user.role.nombre == "Administrador"
          redirect_to unitarios_path
        elsif current_user.role.nombre == "Control Educación Continua"
          redirect_to unitarios_path
        else
          format.html { redirect_to @unitario, notice: 'Los datos del registro se actualizaron correctamente.' }
          format.json { render :show, status: :ok, location: @unitario }
        end
      else
        format.html { render :edit }
        format.json { render json: @unitario.errors, status: :unprocessable_entity }
      end
    #end
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

  def validar_documentos
    respond_to do |format|
      if @unitario.update(validar_documentos_params)
        format.html { redirect_to @unitario, notice: 'El registro de inscripción se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @unitario }
      else
        format.html { render :edit }
        format.json { render json: @unitario.errors, status: :unprocessable_entity }
      end
    end
  end

  def habilitar_constancia
    #respond_to do |format|
      if @unitario.update(habiliar_constancia_params)
        format.html { redirect_to @unitario, notice: 'Se ha habilitado la constancia para este registro.' }
        format.json { render :show, status: :ok, location: @unitario }
      else
        format.html { render :edit }
        format.json { render json: @unitario.errors, status: :unprocessable_entity }
      end
    #end
  end

  def editar_datos
    @unitarios = Unitario.where(id: params[:unitario_ids])
  end

  def actualizar_editar_datos
    Unitario.update(params[:unitarios].keys, params[:unitarios].values)
    flash[:notice] = "Datos guardados"
    redirect_to unitarios_path
  end

  def asignar_calificaciones
    @unitarios = Unitario.where(id: params[:unitario_ids])
  end

  def actualizar_asignar_calificaciones
    Unitario.update(params[:unitarios].keys, params[:unitarios].values)
    flash[:notice] = "Calificaciones guardadas"
    if current_user.role.nombre == "Instructor curso"
      redirect_to panel_instructor_path
    else
      redirect_to grupos_unitarios_path
    end
  end

  def mes
    if Date.today.strftime("%b") == "Jan"
      mes = "Enero"
    elsif Date.today.strftime("%b") == "Feb"
      mes = "Febrero"
    elsif Date.today.strftime("%b") == "Mar"
      mes = "Marzo"
    elsif Date.today.strftime("%b") == "Apr"
      mes = "Abril"
    elsif Date.today.strftime("%b") == "May"
      mes = "Mayo"
    elsif Date.today.strftime("%b") == "Jun"
      mes = "Junio"
    elsif Date.today.strftime("%b") == "Jul"
      mes = "Julio"
    elsif Date.today.strftime("%b") == "Aug"
      mes = "Agosto"
    elsif Date.today.strftime("%b") == "Sep"
      mes = "Septiembre"
    elsif Date.today.strftime("%b") == "Oct"
      mes = "Octubre"
    elsif Date.today.strftime("%b") == "Nov"
      mes = "Noviembre"
    elsif Date.today.strftime("%b") == "Dec"
      mes = "Diciembre"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unitario
      @unitario = Unitario.find(params[:id])
    end

    def validar_documentos_params
      params.require(:unitario).permit(:documentos_validados)
    end

    def habilitar_constancia_params
      params.require(:unitario).permit(:habilitar_constancia)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unitario_params
      params.require(:unitario).permit(:curp, :nombre, :paterno, :materno, :sexo,
      :nacimiento, :domicilio, :codigo_postal, :entidad, :delegacion_municipio,
      :telefono_celular, :telefono_fijo, :correo, :procedencia, :nombre_padre,
      :correo_padre, :telefono_padre, :grupos_unitario_id, :documentos_validados,
      :examen_final)
    end
end
