class Diplomado < ApplicationRecord
  has_many :modulo_diplomados, dependent: :destroy
  accepts_nested_attributes_for :modulo_diplomados, allow_destroy: true, reject_if: proc { |att| att['nombre'].blank? }
end
