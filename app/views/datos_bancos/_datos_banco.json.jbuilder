json.extract! datos_banco, :id, :nombre, :cuenta, :referencia, :titular, :created_at, :updated_at
json.url datos_banco_url(datos_banco, format: :json)