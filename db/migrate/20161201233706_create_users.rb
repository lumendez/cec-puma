class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nombre
      t.belongs_to :role, foreign_key: true

      t.timestamps
    end
  end
end
