class CreateUnitarios < ActiveRecord::Migration[5.0]
  def change
    create_table :unitarios do |t|
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
      t.string :nombre_padre
      t.string :correo_padre
      t.string :telefono_padre

      t.timestamps
    end
  end
end
