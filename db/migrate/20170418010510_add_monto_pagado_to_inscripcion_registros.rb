class AddMontoPagadoToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :monto_pagado, :string
  end
end
