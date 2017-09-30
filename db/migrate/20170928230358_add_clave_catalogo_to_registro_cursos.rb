class AddClaveCatalogoToRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_cursos, :clave_catalogo, :string
  end
end
