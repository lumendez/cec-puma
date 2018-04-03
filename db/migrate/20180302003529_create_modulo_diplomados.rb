class CreateModuloDiplomados < ActiveRecord::Migration[5.0]
  def change
    create_table :modulo_diplomados do |t|
      t.references :diplomado, foreign_key: true
      t.string :nombre
      t.string :horas
      t.string :periodo
      t.string :instructor

      t.timestamps
    end
  end
end
