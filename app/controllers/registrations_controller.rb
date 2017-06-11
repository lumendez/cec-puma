class RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.email_bienvenida(resource).deliver unless resource.invalid?
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :nombre, :paterno, :materno, :rfc, :password, :password_confirmation, :centro_id)
  end

  def account_update_params
    params.require(:user).permit(:email, :nombre, :paterno, :materno, :rfc, :password, :password_confirmation, :current_password, :centro_id)
  end
end
