class AddHorarioToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :horario, :string
  end
end
