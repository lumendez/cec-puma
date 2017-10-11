class AddDocumentosValidadosToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :documentos_validados, :boolean
  end
end
