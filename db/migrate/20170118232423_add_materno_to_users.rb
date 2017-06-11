class AddMaternoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :materno, :string
  end
end
