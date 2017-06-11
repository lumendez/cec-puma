json.extract! registro_curso, :id, :nombre, :horas, :periodo, :temas, :instructor, :created_at, :updated_at
json.url registro_curso_url(registro_curso, format: :json)