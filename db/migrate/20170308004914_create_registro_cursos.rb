class CreateRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :registro_cursos do |t|
      t.string :nombre
      t.string :horas
      t.string :periodo
      t.string :temas
      t.string :instructor

      t.timestamps
    end
  end
end
