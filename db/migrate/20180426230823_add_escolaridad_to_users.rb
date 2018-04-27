class AddEscolaridadToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :escolaridad, :string
  end
end
