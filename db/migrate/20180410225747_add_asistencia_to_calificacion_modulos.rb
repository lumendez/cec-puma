class AddAsistenciaToCalificacionModulos < ActiveRecord::Migration[5.0]
  def change
    add_column :calificacion_modulos, :asistencia, :string
  end
end
