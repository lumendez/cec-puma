class AddCupoToRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_cursos, :cupo, :string
  end
end
