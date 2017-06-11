class Role < ApplicationRecord

  has_many :users

  def self.options_for_select
    order('LOWER(nombre)').map { |e| [e.nombre, e.id] }
  end

end
