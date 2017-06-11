class CreateCurriculums < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums do |t|
      t.string :calle
      t.string :colonia
      t.string :municipui
      t.string :entidad
      t.string :correo
      t.string :telefono
      t.string :celular
      t.string :lugar

      t.timestamps
    end
  end
end
