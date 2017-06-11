class CreateInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    create_table :inscripcion_registros do |t|
      t.string :nombre
      t.string :idioma
      t.string :horario
      t.string :nivel
      t.string :curso
      t.string :opcion_uno
      t.string :opcion_dos
      t.string :telefono
      t.string :periodo
      t.string :correo
      t.string :sexo
      t.string :cuota
      t.string :movimiento
      t.string :procedencia

      t.timestamps
    end
  end
end
