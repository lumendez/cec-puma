json.extract! inscripcion_diplomado, :id, :curp, :nombre, :paterno, :materno, :sexo, :nacimiento, :domicilio, :codigo_postal, :entidad, :delegacion_municipio, :telefono_celular, :telefono_fijo, :correo, :procedencia, :grupos_diplomado_id, :documentos_validados, :created_at, :updated_at
json.url inscripcion_diplomado_url(inscripcion_diplomado, format: :json)
