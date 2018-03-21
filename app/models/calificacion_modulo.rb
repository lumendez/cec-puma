class CalificacionModulo < ApplicationRecord
  belongs_to :inscripcion_diplomado, optional:true
end
