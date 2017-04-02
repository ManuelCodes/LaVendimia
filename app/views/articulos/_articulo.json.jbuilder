json.extract! articulo, :id, :descripcion, :modelo, :precio, :existencia, :created_at, :updated_at
json.url articulo_url(articulo, format: :json)