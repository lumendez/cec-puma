class CreateTipoOferta < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_oferta do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
