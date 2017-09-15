class AddCursoToExamenColocacionIdiomas < ActiveRecord::Migration[5.0]
  def change
    add_column :examen_colocacion_idiomas, :curso, :string
  end
end
