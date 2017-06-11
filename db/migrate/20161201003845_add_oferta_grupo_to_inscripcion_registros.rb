class AddOfertaGrupoToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :oferta_grupo, :string
  end
end
