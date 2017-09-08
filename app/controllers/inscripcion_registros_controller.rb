class InscripcionRegistrosController < ApplicationController
  require 'rqrcode_png'
  before_action :authenticate_user!
  before_action :set_inscripcion_registro, only: [:show, :edit, :update, :destroy]
  before_action :inscripcion_registro, only: :create
  load_and_authorize_resource

  # GET /inscripcion_registros
  # GET /inscripcion_registros.json
  def index
    @filterrific = initialize_filterrific(
    InscripcionRegistro,
    params[:filterrific],
    select_options:{
      sorted_by: InscripcionRegistro.options_for_sorted_by,
      with_grupo_id: Grupo.where(estado: "Abierto").options_for_select,
      with_documentos_validados: InscripcionRegistro.options_for_documentos_validados,
      with_curso: CursoNombre.options_for_select
    },
    ) or return
    @inscripcion_registros = @filterrific.find.order("created_at DESC").where(examen_medio: nil, examen_final: nil).page(params[:pagina])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Se tuvieron que restablecer los valores: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return

  end

  # GET /inscripcion_registros/1
  # GET /inscripcion_registros/1.json
  def show
  end

  # GET /inscripcion_registros/new
  def new
    #Definición de las condiciones para un usuario pueda registrarse. @registro_anterior
    #corresponde al último registro que haya tenido el usuario en el sistema. @registros_no_aprobados
    #cuenta los registro que el usuario tenga previamente reprobados y examen_colocacion si tiene
    #algún examen y que nivel alcanzó a través de él.

    #Se recupera el ultimo registro sin distincion del idioma
    registro_anterior = InscripcionRegistro.where(user_id: current_user.id, idioma: "Inglés").last

    #Se utiliza para aplicar la condición de que si tiene 3 cursos reprobados tendrá que iniciar desde básico 1 o hacer examen de colocación
    registros_no_aprobados = InscripcionRegistro.where("user_id = ? AND examen_medio < ? AND examen_final < ? AND idioma = ? AND nivel LIKE ? OR ? OR ? OR ?", current_user.id, 80, 80, "Inglés", "%Básico%", "%Intermedio%", "%Avanzado%", "%Certificación").last(3)

    #Se utiliza para saber si está vigente el examen de colocación y mostrar la oferta
    examen_colocacion = ExamenColocacionIdioma.where("user_id = ? AND created_at >= ?", current_user.id, Date.today.months_ago(2)).last

    #Se revisa si el usuario no tiene un registro anterior y además, sino tiene registros anteriores
    #no aprobados. Si ambas condiciones se satisfacen, entonces se le permitirá crear un registro
    #de inscripción.
    if registro_anterior.blank? && registros_no_aprobados.blank?
      @inscripcion_registro = current_user.inscripcion_registros.build
    else
      #Cambiar months_ago(2) que es el valor original
      if registro_anterior.curso.include?("Intensivo") && Date.today.months_ago(2) >= registro_anterior.created_at && registro_anterior.documentos_validados == false
        flash[:error] = "Ha dejado pasar dos cursos intensivos, tendrá que comenzar nuevamente desde básico 1 o presentar examen de colocación."
        redirect_to panel_alumnos_path
        #Cambiar months_ago(2) que es el valor original
      elsif registro_anterior.curso.include?("Sabatino") && Date.today.months_ago(2) >= registro_anterior.created_at && registro_anterior.documentos_validados == false
        flash[:error] = "Ha dejado pasar un curso sabatino, tendrá que comenzar nuevamente desde básico 1 o presentar examen de colocación."
        redirect_to panel_alumnos_path
      elsif registros_no_aprobados.present? && registros_no_aprobados.count >= 3
        flash[:error] = "Usted no ha aprobado los últimos tres cursos en este nivel, tendrá que comenzar nuevamente desde básico 1 o presentar examen de colocación."
        redirect_to panel_alumnos_path
      else
        @inscripcion_registro = current_user.inscripcion_registros.build
      end
    end
    #Las siguientes condiciones aplican si el usuario es de nuevo ingreso pero a través
    #de un examen de colocación quedó en cualquiera de los niveles señalados. Revisando
    #primero si existe algún registro previo y posteriormente si posee un examen de
    #colocación.

    # En este caso se muestra básico 1 porque no existe antecedente de examen de
    # colocación o de algún registro previo.
    if registro_anterior.blank? && examen_colocacion.blank?
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 1', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 1', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 2', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 3', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 4', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 5', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 1', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 2', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 3', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 4', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 5', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 1', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 2', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 3', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 4', estado: 'Abierto')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 5', estado: 'Abierto')
    # Aquí se presentan los niveles basados en si existen registros anteriores y
    # si están aprobados. Si están aprobados se les muestra el siguiente nivel,
    # sino, se le presenta el mismo nivel en el que estaba.
    elsif registro_anterior.nivel == 'Básico 1' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 1' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 1', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 2' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 2' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 3' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 4', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 3' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 4' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 5', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 4' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 4', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 5' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 1', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Básico 5' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 5', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 1' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 1' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 1', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 2' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 2' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 3' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 4', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 3' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 4' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 5', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 4' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 4', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 5' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 1', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Intermedio 5' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 5', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 1' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 1' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 1', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 2' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 2' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 3' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 4', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 3' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 4' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 5', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 4' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 4', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Avanzado 5' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 5', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación de Metodología TKT 1' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación de Metodología TKT 2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación de Metodología TKT 1' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación de Metodología TKT 1', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación de Metodología TKT 2' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación de Metodología TKT 3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación de Metodología TKT 2' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación de Metodología TKT 2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación de Metodología TKT 3' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación de Metodología TKT 3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación del Nivel de Dominio B2.1' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación del Nivel de Dominio B2.2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación del Nivel de Dominio B2.1' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación del Nivel de Dominio B2.1', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación del Nivel de Dominio B2.2' && registro_anterior.promedio >= 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación del Nivel de Dominio B2.3', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación del Nivel de Dominio B2.2' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación del Nivel de Dominio B2.2', estado: 'Abierto')
    elsif registro_anterior.nivel == 'Certificación del Nivel de Dominio B2.3' && registro_anterior.promedio < 80
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Certificación del Nivel de Dominio B2.3', estado: 'Abierto')
    end
  end

  # GET /inscripcion_registros/1/edit
  def edit
    registro_anterior = InscripcionRegistro.where(user_id: @inscripcion_registro.user_id, idioma: "Inglés").last
    examen_colocacion = ExamenColocacionIdioma.where("user_id = ? AND created_at >= ?", @inscripcion_registro.user_id, Date.today.months_ago(2)).last
    #Las siguientes condiciones aplican para que el usuario pueda editar su registro
    #de preinscrición sin que le aparezcan otros grupos que no correspondan con su nivel.
    if registro_anterior.blank? && examen_colocacion.blank?
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 1')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 1')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 2')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 3')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 4')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Básico 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 5')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 1')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 2')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 3')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 4')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Intermedio 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 5')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 1')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 2')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 3')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 4')
    elsif registro_anterior.blank? && examen_colocacion.nivel_asignado == 'Avanzado 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 5')
    elsif registro_anterior.nivel == 'Básico 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 1')
    elsif registro_anterior.nivel == 'Básico 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 2')
    elsif registro_anterior.nivel == 'Básico 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 3')
    elsif registro_anterior.nivel == 'Básico 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 4')
    elsif registro_anterior.nivel == 'Básico 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Básico 5')
    elsif registro_anterior.nivel == 'Intermedio 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 1')
    elsif registro_anterior.nivel == 'Intermedio 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 2')
    elsif registro_anterior.nivel == 'Intermedio 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 3')
    elsif registro_anterior.nivel == 'Intermedio 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 4')
    elsif registro_anterior.nivel == 'Intermedio 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Intermedio 5')
    elsif registro_anterior.nivel == 'Avanzado 1'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 1')
    elsif registro_anterior.nivel == 'Avanzado 2'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 2')
    elsif registro_anterior.nivel == 'Avanzado 3'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 3')
    elsif registro_anterior.nivel == 'Avanzado 4'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 4')
    elsif registro_anterior.nivel == 'Avanzado 5'
      @grupos = Grupo.where(idioma: "Inglés", nivel: 'Avanzado 5')
    end
  end

  # POST /inscripcion_registros
  # POST /inscripcion_registros.json
  def create


      @inscripcion_registro = current_user.inscripcion_registros.build(inscripcion_registro_params)

      #Se cuenta cuantas personas se han preinscrito a un grupo. Se cuenta con todos los registros no
      #importando que éstos no hayan sido validados. El dato se obtiene a través de todos los registros
      #de preinscripción, el id para el grupo actual se obtiene con @inscripcion_registro.grupo_id
      cupos = InscripcionRegistro.where(grupo_id: @inscripcion_registro.grupo_id).count

      #Se localiza si el usuatio tiene un id previo con ese mismo grupo. Si existe se le envia un mensaje
      # y no se permite guardar el registro por segunda ocasión.
      usuario = User.find(current_user.id)
      registro = InscripcionRegistro.find_by(user_id: usuario, grupo_id: @inscripcion_registro.grupo_id)

      #Si el cupo del grupo excede los 25 alunos se le muestra un mensaje al usuario donde se le indica
      #que deberá elegir un grupo distinto, el registro de inscripción no se guardará en la base dde datos_bancos
      #hay que agregar este metodo a las rb de el modelo correspondiente.
      if cupos > 40
        redirect_to new_inscripcion_registro_path, notice: "El grupo ha alcanzado su ocupación máxima. Por favor elija otro grupo"
      elsif registro.present? && registro.grupo_id == @inscripcion_registro.grupo_id
        redirect_to panel_alumnos_path, notice: "Usted ya tiene registrada una solicitud con este grupo."
      else

      respond_to do |format|
        if @inscripcion_registro.save
          format.html { redirect_to @inscripcion_registro, notice: 'El registro de inscripción se creó correctamente.' }
          format.json { render :show, status: :created, location: @inscripcion_registro }
        else
          format.html { render :new }
          format.json { render json: @inscripcion_registro.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /inscripcion_registros/1
  # PATCH/PUT /inscripcion_registros/1.json
  def update
    #respond_to do |format|
      if @inscripcion_registro.update(inscripcion_registro_params)
        #Se envia un correo al usuario indicándole que su inscripción ha sido modificada en alguno de los
        #siguientes casos: la inscripción fue validada, su inscripción fue invalidada o, se le cambio de
        #grupo.
        #UserMailer.email_inscripcion_registro(inscripcion_registro).deliver
        #Se redirige al usuario usuario que ha iniciado sesión con un mensaje diferente según sea el caso.
        #Si se agrega el otro rol al sistema se deberá de agregar también una nueva redirección y un nuevo
        #mensaje.
        if current_user.role.nombre == "Control escolar"
          redirect_to inscripcion_registros_path, notice: 'El registro de inscripción se actualizó correctamente.'
        elsif current_user.role.nombre == "Profesor"
          redirect_to grupos_path, notice: 'La calificación se guardó correctamente.'
        elsif current_user.role.nombre == "Administrador"
          redirect_to inscripcion_registros_path, notice: 'El registro de inscripción se actualizó correctamente.'
        elsif current_user.role.nombre == "Invitado"
          redirect_to panel_alumnos_path, notice: 'El registro de inscripción se actualizó correctamente.'
        else
          format.html { redirect_to @inscripcion_registro, notice: 'El registro de inscripción se actualizó correctamente.' }
          format.json { render :show, status: :ok, location: @inscripcion_registro }
        end
      else
        format.html { render :edit }
        format.json { render json: @inscripcion_registro.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /inscripcion_registros/1
  # DELETE /inscripcion_registros/1.json
  def destroy
    @inscripcion_registro.destroy
    respond_to do |format|
      format.html { redirect_to inscripcion_registros_url, notice: 'El registro de inscripción se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  def control_escolar
    respond_to do |format|
      if @inscripcion_registro.update(control_escolar_params)
        format.html { redirect_to @inscripcion_registro, notice: 'El registro de inscripción se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @inscripcion_registro }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  def evaluacion_media
    #respond_to do |format|
      if @inscripcion_registro.update(evaluacion_media_params)
        format.html { redirect_to @inscripcion_registro, notice: 'El registro de inscripción se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @inscripcion_registro }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion_registro.errors, status: :unprocessable_entity }
      end
    #end
  end

  def evaluacion_final
    #respond_to do |format|
      if @inscripcion_registro.update(evaluacion_final_params)
        format.html { redirect_to @inscripcion_registro, notice: 'El registro de inscripción se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @inscripcion_registro }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion_registro.errors, status: :unprocessable_entity }
      end
    #end
  end

  def habilitar_constancia
    #respond_to do |format|
      if @inscripcion_registro.update(habiliar_constancia_params)
        format.html { redirect_to @inscripcion_registro, notice: 'Se ha habilitado la constancia para este registro.' }
        format.json { render :show, status: :ok, location: @inscripcion_registro }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion_registro.errors, status: :unprocessable_entity }
      end
    #end
  end

  def habiliar_historial_academico
    #respond_to do |format|
      if @inscripcion_registro.update(habilitar_historial_academico_params)
        format.html { redirect_to @inscripcion_registro, notice: 'Se ha habilitado el historial para este registro.' }
        format.json { render :show, status: :ok, location: @inscripcion_registro }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion_registro.errors, status: :unprocessable_entity }
      end
    #end
  end

  def habilitar_multiples_constancias
    @inscripcion_registros = InscripcionRegistro.find(params[:inscripcion_registro_ids])
  end

  def actualizar_multiples_constancias
    @inscripcion_registros = InscripcionRegistro.find(params[:inscripcion_registro_ids])
    @inscripcion_registros.each do |inscripcion_registro|
      inscripcion_registro.update(habilitar_constancia_params)
    end
    flash[:notice] = "Constancias habilitadas!"
    redirect_to ver_constancias_inscripcion_registros_path
  end

  def ver_constancias
    #@inscripcion_registros = InscripcionRegistro.where(habilitar_constancia: true).order('paterno DESC').page params[:pagina]
    @filterrific = initialize_filterrific(
    InscripcionRegistro,
    params[:filterrific],
    ) or return
    @inscripcion_registros = @filterrific.find.page(params[:pagina])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Se tuvieron que restablecer los valores: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return

  end

  def constancia
    @qr = RQRCode::QRCode.new(request.original_url).to_img.resize(100, 100).to_data_url
  end

  def imprimir
    @inscripcion_registros = InscripcionRegistro.find(params[:inscripcion_registro_ids])
  end

  def asignar_calificaciones
    @inscripcion_registros = InscripcionRegistro.find(params[:inscripcion_registro_ids])
  end

  def actualizar_asignar_calificaciones
    InscripcionRegistro.update(params[:inscripcion_registros].keys, params[:inscripcion_registros].values)
    flash[:notice] = "Calificaciones guardadas"
    if current_user.role.nombre == "Profesor"
      redirect_to panel_profesores_path
    else
      redirect_to grupos_path
    end
  end

  def reporte_curso
    @filterrific = initialize_filterrific(
    InscripcionRegistro,
    params[:filterrific],
    select_options:{
      sorted_by: InscripcionRegistro.options_for_sorted_by,
      with_curso: CursoNombre.options_for_select
    },
    ) or return
    @inscripcion_registros = @filterrific.find.order("created_at DESC").page(params[:pagina])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Se tuvieron que restablecer los valores: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  def reporte_dec
    @filterrific = initialize_filterrific(
    InscripcionRegistro,
    params[:filterrific],
    select_options:{
      sorted_by: InscripcionRegistro.options_for_sorted_by,
      with_curso: CursoNombre.options_for_select
    },
    ) or return
    @inscripcion_registros = @filterrific.find.order("created_at DESC").page(params[:pagina])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Se tuvieron que restablecer los valores: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  def editar_datos
    @inscripcion_registros = InscripcionRegistro.find(params[:inscripcion_registro_ids])
  end

  def actualizar_editar_datos
    #@inscripcion_registros = InscripcionRegistro.find(params[:inscripcion_registro_ids])
    InscripcionRegistro.update(params[:inscripcion_registros].keys, params[:inscripcion_registros].values)
    flash[:notice] = "Datos guardados"
    redirect_to inscripcion_registros_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscripcion_registro
      @inscripcion_registro = InscripcionRegistro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscripcion_registro_params
      params.require(:inscripcion_registro).permit(:nombre, :paterno, :materno, :idioma, :horario, :nivel, :curso, :opcion_uno, :opcion_dos, :telefono, :periodo, :correo, :sexo, :monto_pagado,
       :cuota, :movimiento, :procedencia, :grupo_id, :examen_medio, :examen_final, :documentos_validados, :boleta, :imagen, :habilitar_historial, :habilitar_constancia, :oficio_prestacion)
    end

    def inscripcion_registro
      @inscripcion_registro = InscripcionRegistro.new(inscripcion_registro_params)
    end

    def control_escolar_params
      params.require(:inscripcion_registro).permit(:grupo_id, :documentos_validados, :boleta)
    end

    def evaluacion_media_params
      params.require(:inscripcion_registro).permit(:examen_medio)
    end

    def evaluacion_final_params
      params.require(:inscripcion_registro).permit(:examen_medio)
    end

    def habilitar_constancia_params
      params.require(:inscripcion_registro).permit(:habilitar_constancia)
    end

    def habilitar_historial_academico_params
      params.require(:inscripcion_registro).permit(:habilitar_historial)
    end

    def calificaciones_params
      params.require(:inscripcion_registro).permit(:examen_medio, :examen_final)
    end

    def editar_datos_params
      params.require(:inscripcion_registro).permit(:movimiento, :monto_pagado)
    end

end
