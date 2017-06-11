class AddPaternoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :paterno, :string
  end
end
