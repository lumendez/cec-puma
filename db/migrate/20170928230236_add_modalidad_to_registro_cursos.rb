class AddModalidadToRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_cursos, :modalidad, :string
  end
end
