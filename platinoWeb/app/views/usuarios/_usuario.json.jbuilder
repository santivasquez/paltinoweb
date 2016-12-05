json.extract! usuario, :id, :nombre, :apellido, :correo, :empresa, :lotes_id, :clave, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)