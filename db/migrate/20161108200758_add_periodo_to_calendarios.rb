class AddPeriodoToCalendarios < ActiveRecord::Migration[5.0]
  def change
    add_column :calendarios, :periodo, :string
  end
end
