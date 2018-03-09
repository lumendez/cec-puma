class InscripcionDiplomado < ApplicationRecord
  belongs_to :grupos_diplomado
  has_many :calificacion_modulos, dependent: :destroy
  accepts_nested_attributes_for :calificacion_modulos, allow_destroy: true
end
