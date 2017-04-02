json.extract! configuracion, :id, :tasa, :prc_enganche, :plazo_maximo, :created_at, :updated_at
json.url configuracion_url(configuracion, format: :json)