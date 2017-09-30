class AddTipoOfertaToRegistroCursos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_cursos, :tipo_oferta, :string
  end
end
