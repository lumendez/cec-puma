class AddRegistroToRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_cursos, :registro, :string
  end
end
