class UnitariosController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new, :show, :carta_compromiso]
  before_action :set_unitario, only: [:show, :edit, :update, :destroy]

  # GET /unitarios
  # GET /unitarios.json
  def index
    #@unitarios = Unitario.all
    #@grupos_unitarios = GruposUnitario.all
    @filterrific = initialize_filterrific(
    Unitario,
    params[:filterrific],
    select_options: {
      with_grupos_unitario_id: GruposUnitario.where(estado: "Abierto").seleccion_curso_nombre,
      with_documentos_validados: Unitario.options_for_documentos_validados,
      with_grupos_creados_id: GruposUnitario.seleccion_grupo_nombre
    },
  ) or return
  @unitarios = @filterrific.find.page(params[:pagina])

  respond_to do |format|
    format.html
    format.js
  end

  rescue ActiveRecord::RecordNotFound => e
  # There is an issue with the persisted param_set. Reset it.
  puts "Se restablecieron los parámetros: #{ e.message }"
  redirect_to(reset_filterrific_url(format: :html)) and return
  end

  def asignar_grupos_nms_s
    @filterrific = initialize_filterrific(
    Unitario,
    params[:filterrific],
    select_options: {
      with_grupos_unitario_id: GruposUnitario.where(estado: "Abierto").seleccion_curso_nombre,
      with_documentos_validados: Unitario.options_for_documentos_validados
    },
  ) or return
  @unitarios = @filterrific.find.page(params[:pagina])

  respond_to do |format|
    format.html
    format.js
  end

  rescue ActiveRecord::RecordNotFound => e
  # There is an issue with the persisted param_set. Reset it.
  puts "Se restablecieron los parámetros: #{ e.message }"
  redirect_to(reset_filterrific_url(format: :html)) and return
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

    # Esto redirecciona a 'show' para que en los cursos de preparación se pueda
    # imprimir la carta compromiso, para los demás cursos puede existir esa
    # opción pero de momento se les redirecciona a la página principal y se les
    # notifica que su inscripción se realizó de manera correcta.
    if @unitario.grupos_unitario.nombre.include? "Curso de Preparación para el Examen de Admisión al Nivel Superior" or @unitario.grupos_unitario.nombre.include? "Curso de Preparación para el Examen de Admisión al Nivel Medio Superior"
      respond_to do |format|
        if @unitario.save
          format.html { redirect_to @unitario, notice: 'Su registro se creó correctamente.' }
          format.json { render :show, status: :created, location: @unitario }
        else
          format.html { render :new }
          format.json { render json: @unitario.errors, status: :unprocessable_entity }
        end
      end
    # Si los cursos unitarios no son de media y superior se les redirecciona a la
    # página principal de la aplicación.
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
        elsif user_signed_in? && current_user.role.nombre == "Cursos control"
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

  # Se utiliza la variable @unitarios para generar el documento en hoja de
  # cálculo con todos los registros unitarios validados, tambien se puede
  # utilizar en la vista
  def reporte_dems
    @unitarios = Unitario.where(documentos_validados: true).order('paterno ASC')
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # Se utiliza la variable @unitarios para generar el documento en hoja de
  # cálculo con todos los registros unitarios validados, tambien se puede
  # utilizar en la vista
  def reporte_no_validados
    @unitarios = Unitario.where(documentos_validados: false).order('paterno ASC')
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # Se utiliza la variable @unitarios para generar el documento en hoja de
  # cálculo con todos los contactos (padre o tutor) de los registros
  # unitarios validados.
  def reporte_contactos
    @unitarios = Unitario.where(documentos_validados: true).order('paterno ASC')
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def generar_credenciales
    @unitarios = Unitario.all
  end

  def imprimir_credenciales_media
    @unitarios = Unitario.where(documentos_validados: true).includes(:grupos_unitario).where(:grupos_unitarios => { nombre: "Curso de Preparación para el Examen de Admisión al Nivel Medio Superior 2019" } ).order(:paterno)
    @multiplo = 4
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "credenciales",
        disposition: "attachment",
        template: "unitarios/credenciales_grupos_media.html.erb",
        layout: "credenciales_pdf.html.erb"
        #margin: {top: 15}
      end
    end
  end

  def imprimir_credenciales_superior
    @unitarios = Unitario.where(documentos_validados: true).includes(:grupos_unitario).where(:grupos_unitarios => { nombre: "Curso de Preparación para el Examen de Admisión al Nivel Superior 2019" } ).order(:paterno)
    @multiplo = 4
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "credenciales",
        disposition: "attachment",
        template: "unitarios/credenciales_grupos_superior.html.erb",
        layout: "credenciales_pdf.html.erb"
        #margin: {top: 15}
      end
    end
  end

  def imprimir_credenciales_media_grupo
    @unitarios = Unitario.where(documentos_validados: true).includes(:grupos_unitario).order('seccion ASC').where(:grupos_unitarios => { nombre: "Curso de Preparación para el Examen de Admisión al Nivel Medio Superior 2019" } ).order(:paterno)
    @multiplo = 4
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "credenciales",
        disposition: "attachment",
        template: "unitarios/credenciales_grupos_media.html.erb",
        layout: "credenciales_pdf.html.erb"
        #margin: {top: 15}
      end
    end
  end

  def imprimir_credenciales_superior_grupo
    @unitarios = Unitario.where(documentos_validados: true).includes(:grupos_unitario).order('seccion ASC').where(:grupos_unitarios => { nombre: "Curso de Preparación para el Examen de Admisión al Nivel Superior 2019" } ).order(:paterno)
    @multiplo = 4
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "credenciales",
        disposition: "attachment",
        template: "unitarios/credenciales_grupos_superior.html.erb",
        layout: "credenciales_pdf.html.erb"
        #margin: {top: 15}
      end
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

  def grupos_nms_s
    @unitarios = Unitario.find(params[:unitario_ids])
  end

  def actualizar_grupos_nms_s
    @unitarios = Unitario.find(params[:unitario_ids])
    @unitarios.each do |unitario|
      unitario.update(asignar_grupo_params)
    end
    flash[:notice] = "Grupos asignados correctamente!"
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

  def carta_compromiso
    @mes = mes
    @unitario = Unitario.find(params[:id])
    respond_to do |format|
     format.pdf do
       render pdf: "carta_compromiso",
       disposition: "attachment",
       template: "unitarios/carta_compromiso.html.erb",
       layout: "carta_compromiso_pdf.html.erb",
       margin: {top: 25}
     end
    end
  end

  def credenciales_media
    @unitario = Unitario.find(params[:id])
    if @unitario.grupos_unitario.nombre.include?("Curso propedéutico para el examen de admisión al Nivel Medio Superior")
      respond_to do |format|
       format.html
       format.pdf do
         render pdf: "credenciales_media",
         disposition: "attachment",
         template: "unitarios/credenciales_media.html.erb",
         layout: "credenciales_media_pdf.html",
         background: true,
         no_background: false,
         margin: {top: 20}
       end
      end
    elsif @unitario.grupos_unitario.nombre.include?("Curso de preparación para el examen de admisión al Nivel Superior")
      respond_to do |format|
       format.html
       format.pdf do
         render pdf: "credenciales_superior",
         disposition: "attachment",
         template: "unitarios/credenciales_superior.html.erb",
         layout: "credenciales_superior_pdf.html",
         background: true,
         no_background: false,
         margin: {top: 20}
       end
      end
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
      :examen_final, :image, :familiar_ipn, :nombre_ipn, :unidad_ipn, :parentesco_ipn,
      :bachillerato_ipn, :solicito_beca, :fecha_validacion)
    end

    def asignar_grupo_params
      params.require(:unitario).permit(:grupos_unitario_id)
    end
end
