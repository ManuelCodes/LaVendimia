json.extract! cliente, :id, :nom_cliente, :ap_paterno, :ap_materno, :rfc, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)