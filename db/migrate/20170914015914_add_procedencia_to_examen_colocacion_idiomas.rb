class AddProcedenciaToExamenColocacionIdiomas < ActiveRecord::Migration[5.0]
  def change
    add_column :examen_colocacion_idiomas, :procedencia, :string
  end
end
