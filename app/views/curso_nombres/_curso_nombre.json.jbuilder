json.extract! curso_nombre, :id, :nombre, :created_at, :updated_at
json.url curso_nombre_url(curso_nombre, format: :json)