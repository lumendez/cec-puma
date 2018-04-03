class RemoveHorarioFromDiplomados < ActiveRecord::Migration[5.0]
  def change
    remove_column :diplomados, :horario, :string
  end
end
