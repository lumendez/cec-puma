class CreateLugarNombres < ActiveRecord::Migration[5.0]
  def change
    create_table :lugar_nombres do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
