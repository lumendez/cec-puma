class AddNumeroModuloToCalificacionModulos < ActiveRecord::Migration[5.0]
  def change
    add_column :calificacion_modulos, :numero_modulo, :string
  end
end
