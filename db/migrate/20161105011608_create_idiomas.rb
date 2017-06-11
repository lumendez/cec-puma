class CreateIdiomas < ActiveRecord::Migration[5.0]
  def change
    create_table :idiomas do |t|
      t.string :idioma

      t.timestamps
    end
  end
end
