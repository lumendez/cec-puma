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
