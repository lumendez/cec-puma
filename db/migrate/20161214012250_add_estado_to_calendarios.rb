class AddEstadoToCalendarios < ActiveRecord::Migration[5.0]
  def change
    add_column :calendarios, :estado, :string
  end
end
