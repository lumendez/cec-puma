class UserMailer < ApplicationMailer
  default :from => "cec-ceciemd@ipn.mx"

  def email_bienvenida(user)
    @user = user
    mail(to: user.email, subject: "Bienvenido al sistema de Inscripciones de CECIEMD")
  end

  def email_inscripcion_registro(inscripcion_registro)
    @inscripcion_registro = inscripcion_registro
    mail(to: inscripcion_registro.correo, subject: "Información acerca de su inscripción")
  end
end
