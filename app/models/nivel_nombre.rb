class NivelNombre < ApplicationRecord

  def self.options_for_select
    order('LOWER(nivel)').map { |e| [e.nivel] }
  end

end
