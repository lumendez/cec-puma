class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Formato dd/mm/aaaa a las hora:minutos para cualquier objeto en la aplicación
  def creado
    self.created_at.strftime("%d/%m/%y a las %T %P")
  end
  # Si un registro tiene los atributos "nombre", "paterno" y "materno" se crea
  # una cadena con el nombre completo iniciando por el apellido
  def paterno_materno_nombre
    "#{paterno} #{materno} #{nombre}"
  end

  # Si un registro tiene los atributos "nombre", "paterno" y "materno" se crea
  # una cadena con el nombre completo iniciando por el nombre
  def nombre_paterno_materno
    "#{nombre} #{paterno} #{materno}"
  end

end
