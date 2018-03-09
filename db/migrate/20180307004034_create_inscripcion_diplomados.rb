class CreateInscripcionDiplomados < ActiveRecord::Migration[5.0]
  def change
    create_table :inscripcion_diplomados do |t|
      t.string :curp
      t.string :nombre
      t.string :paterno
      t.string :materno
      t.string :sexo
      t.string :nacimiento
      t.string :domicilio
      t.string :codigo_postal
      t.string :entidad
      t.string :delegacion_municipio
      t.string :telefono_celular
      t.string :telefono_fijo
      t.string :correo
      t.string :procedencia
      t.references :grupos_diplomado, foreign_key: true
      t.boolean :documentos_validados

      t.timestamps
    end
  end
end
