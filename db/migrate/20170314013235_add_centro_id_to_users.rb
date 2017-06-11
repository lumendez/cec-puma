class AddCentroIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :centro, foreign_key: true
  end
end
