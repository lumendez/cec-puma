class CreateCuotaCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cuota_cursos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
