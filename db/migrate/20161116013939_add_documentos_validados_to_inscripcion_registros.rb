class AddDocumentosValidadosToInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :inscripcion_registros, :documentos_validados, :boolean
  end
end
