class AddAnioToCalendarios < ActiveRecord::Migration[5.0]
  def change
    add_column :calendarios, :anio, :string
  end
end
