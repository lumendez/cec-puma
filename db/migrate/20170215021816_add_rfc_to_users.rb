class AddRfcToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rfc, :string
  end
end
