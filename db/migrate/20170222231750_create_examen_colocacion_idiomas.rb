class CreateExamenColocacionIdiomas < ActiveRecord::Migration[5.0]
  def change
    create_table :examen_colocacion_idiomas do |t|
      t.string :nombre
      t.string :paterno
      t.string :materno
      t.string :idioma
      t.string :nivel_asignado
      t.string :examinador

      t.timestamps
    end
  end
end
