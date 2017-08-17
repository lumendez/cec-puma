class CursoNombre < ApplicationRecord
  def self.options_for_select
    order('LOWER(nombre)').map { |e| [e.nombre] }
  end

end
