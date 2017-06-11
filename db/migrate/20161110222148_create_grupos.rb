class CreateGrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :grupos do |t|
      t.string :nombre
      t.belongs_to :profesor_nombre, foreign_key: true

      t.timestamps
    end
  end
end
