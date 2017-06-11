class CreateClaveCatalogos < ActiveRecord::Migration[5.0]
  def change
    create_table :clave_catalogos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
