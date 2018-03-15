class Diplomado < ApplicationRecord
  has_many :modulo_diplomados, dependent: :destroy
  accepts_nested_attributes_for :modulo_diplomados, allow_destroy: true, reject_if: proc { |att| att['nombre'].blank? }

  # Muestra la fecha en que fue creado el diplomado para la vista de diplomados
  def creado
    self.created_at.strftime("%d/%m/%y a las %T %P")
  end

  # Calcula el número de módulo de un diplomado
  def modulos
    modulos = self.modulo_diplomados.count
  end
end
