class UserMailer < ApplicationMailer
  default :from => "celex@ipn.mx"

  def email_bienvenida(user)
    @user = user
    mail(to: user.email, subject: "Bienvenido al sistema CELEX")
  end

  def email_inscripcion_registro(inscripcion_registro)
    @inscripcion_registro = inscripcion_registro
    mail(to: inscripcion_registro.correo, subject: "Información acerca de su inscripción")
  end
end
