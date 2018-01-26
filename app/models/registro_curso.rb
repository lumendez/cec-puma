class RegistroCurso < ApplicationRecord
  validates :nombre, :horas, :registro, :tipo_oferta, :modalidad, :cupo, presence: true
end
