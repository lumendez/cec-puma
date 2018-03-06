class CreateDiplomados < ActiveRecord::Migration[5.0]
  def change
    create_table :diplomados do |t|
      t.string :nombre
      t.string :dependencia
      t.string :sede
      t.string :registro
      t.string :inicio
      t.string :termino
      t.string :horario

      t.timestamps
    end
  end
end
