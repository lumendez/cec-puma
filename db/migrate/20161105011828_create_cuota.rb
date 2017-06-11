class CreateCuota < ActiveRecord::Migration[5.0]
  def change
    create_table :cuota do |t|
      t.decimal :cuota, precision: 6, scale: 1

      t.timestamps
    end
  end
end
