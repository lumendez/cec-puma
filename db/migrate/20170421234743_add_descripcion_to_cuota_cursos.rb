class AddDescripcionToCuotaCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :cuota_cursos, :descripcion, :string
  end
end
