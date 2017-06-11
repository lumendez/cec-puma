class CreateProcedencia < ActiveRecord::Migration[5.0]
  def change
    create_table :procedencia do |t|
      t.string :procedencia

      t.timestamps
    end
  end
end
