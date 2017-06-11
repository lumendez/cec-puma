class CreateNumeroRegistros < ActiveRecord::Migration[5.0]
  def change
    create_table :numero_registros do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
