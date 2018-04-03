class AddNumeroModuloToModuloDiplomados < ActiveRecord::Migration[5.0]
  def change
    add_column :modulo_diplomados, :numero_modulo, :string
  end
end
