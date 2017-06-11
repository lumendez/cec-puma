class CreateCalendarios < ActiveRecord::Migration[5.0]
  def change
    create_table :calendarios do |t|
      t.string :nombre
      t.string :registro
      t.string :examen_colocacion
      t.string :inicio_curso
      t.string :examen_medio
      t.string :examen_final
      t.string :entrega_boletas
      t.string :suspension_labores
      t.string :vacaciones

      t.timestamps
    end
  end
end
