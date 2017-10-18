class Unitario < ApplicationRecord

  belongs_to :grupos_unitario
  validates :curp, :nombre, :paterno, :materno, :sexo, :nacimiento, :telefono_celular,
  :correo, :sexo, presence: true

  def paterno_materno_nombre
    "#{paterno} #{materno} #{nombre}"
  end

  def nombre_paterno_materno
    "#{nombre} #{paterno} #{materno}"
  end

  def creado
    self.created_at.strftime("%d/%m/%y a las %T %P")
  end

  def anio
    self.created_at.strftime("%Y")
  end

  def self.buscar(folio_carta)
    self.where("unitarios.id = ?", "#{folio_carta}")
  end

end
