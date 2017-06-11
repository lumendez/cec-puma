class CreateCursoNombres < ActiveRecord::Migration[5.0]
  def change
    create_table :curso_nombres do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
