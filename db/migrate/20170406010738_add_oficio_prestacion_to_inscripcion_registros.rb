class AddOficioPrestacionToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :oficio_prestacion, :string
  end
end
