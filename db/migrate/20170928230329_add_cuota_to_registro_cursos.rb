class AddCuotaToRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_cursos, :cuota, :string
  end
end
