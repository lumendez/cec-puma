class CreateItInscripcionRegistros < ActiveRecord::Migration[5.0]
  def change
    create_table :it_inscripcion_registros do |t|
      t.string :nombre
      t.string :paterno
      t.string :materno
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
      t.references :grupo, foreign_key: true
      t.integer :examen_medio
      t.integer :examen_final
      t.boolean :documentos_validados
      t.string :boleta
      t.string :oferta_grupo
      t.references :user, foreign_key: true
      t.boolean :habilitar_constancia
      t.boolean :habilitar_historial
      t.string :oficio_prestacion
      t.string :monto_pagado

      t.timestamps
    end
  end
end
