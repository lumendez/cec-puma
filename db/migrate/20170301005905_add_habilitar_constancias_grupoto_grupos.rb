class AddHabilitarConstanciasGrupotoGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :habilitar_constancias_grupo, :boolean
  end
end
