class AddUserIdToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_reference :grupos, :user, foreign_key: true
  end
end
