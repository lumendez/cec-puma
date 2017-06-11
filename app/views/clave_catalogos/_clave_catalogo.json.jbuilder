json.extract! clave_catalogo, :id, :nombre, :created_at, :updated_at
json.url clave_catalogo_url(clave_catalogo, format: :json)