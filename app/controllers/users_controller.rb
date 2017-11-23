class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :user, only: :create
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    #@users = User.all.order("paterno ASC").page params[:pagina]
      @filterrific = initialize_filterrific(
      User,
      params[:filterrific],
      select_options: {
        with_role_id: Role.options_for_select
      },
    ) or return
    @users = @filterrific.find.page(params[:pagina])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'El usuario se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'El usuario se ha actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'El usuario se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def instructores
    @users = User.instructores.order(:paterno).page params[:pagina]
  end

  def historiales_ingles
    @users = User.alumnos.order(:paterno).page params[:pagina]
  end

  def historial_ingles
      @inscripcion_registros = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés')
      @examen_colocacion = ExamenColocacionIdioma.find_by(user_id: @user.id, idioma: 'Inglés')

      @basico1 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Básico 1").last
      @basico2 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Básico 2").last
      @basico3 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Básico 3").last
      @basico4 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Básico 4").last
      @basico5 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Básico 5").last
      @intermedio1 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Intermedio 1").last
      @intermedio2 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Intermedio 2").last
      @intermedio3 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Intermedio 3").last
      @intermedio4 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Intermedio 4").last
      @intermedio5 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Intermedio 5").last
      @avanzado1 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Avanzado 1").last
      @avanzado2 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Avanzado 2").last
      @avanzado3 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Avanzado 3").last
      @avanzado4 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Avanzado 4").last
      @avanzado5 = InscripcionRegistro.where(nombre: @user.nombre, paterno: @user.paterno, materno: @user.materno, idioma: 'Inglés', nivel: "Avanzado 5").last

      fecha = Date.today
      @dias = fecha.day
      if fecha.month == 1
        @mes = "enero"
      elsif fecha.month == 2
        @mes = "febrero"
      elsif fecha.month == 3
        @mes = "marzo"
      elsif fecha.month == 4
        @mes = "abril"
      elsif fecha.month == 5
        @mes = "mayo"
      elsif fecha.month == 6
        @mes = "junio"
      elsif fecha.month == 7
        @mes = "julio"
      elsif fecha.month == 8
        @mes = "agosto"
      elsif fecha.month == 9
        @mes = "septiembre"
      elsif fecha.month == 10
        @mes = "octubre"
      elsif fecha.month == 11
        @mes = "noviembre"
      elsif fecha.month == 12
        @mes = "diciembre"
      end

      if fecha.year == 2017
        @anio = "dos mil diecisiete"
      elsif fecha.year == 2018
        @anio = "dos mil dieciocho"
      elsif fecha.year == 2019
        @anio = "dos mil diecinueve"
      elsif fecha.year == 2020
        @anio = "dos mil veinte"
      end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user
      @user = User.new(user_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombre, :role_id, :materno, :paterno, :rfc, :centro_id, :email)
    end
end
