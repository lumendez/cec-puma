class CreateSeccionNombres < ActiveRecord::Migration[5.0]
  def change
    create_table :seccion_nombres do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
