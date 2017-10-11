class AddHorarioToRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_cursos, :horario, :string
  end
end
