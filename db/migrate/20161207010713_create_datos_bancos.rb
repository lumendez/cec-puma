class CreateDatosBancos < ActiveRecord::Migration[5.0]
  def change
    create_table :datos_bancos do |t|
      t.string :nombre
      t.string :cuenta
      t.string :referencia
      t.string :titular

      t.timestamps
    end
  end
end
