class Diplomado < ApplicationRecord
  has_many :modulo_diplomados, dependent: :destroy
  accepts_nested_attributes_for :modulo_diplomados, allow_destroy: true, reject_if: proc { |att| att['nombre'].blank? }

  # Calcula el número de módulo de un diplomado
  def modulos
    modulos = self.modulo_diplomados.count
  end
end
