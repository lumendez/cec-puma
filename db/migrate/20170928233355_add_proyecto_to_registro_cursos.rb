class AddProyectoToRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_cursos, :proyecto, :string
  end
end
