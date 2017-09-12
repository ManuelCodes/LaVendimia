module VentasHelper
	def show_articulo 
		@articulo = Articulo.find( params[:id_articulo] );
	end

	def calcular_configuracion_precio configuracion
		#configuracion = Configuracion.find(1)
		numerador   = ( configuracion.tasa *  configuracion.plazo_maximo ) 
		denominador = 100
		resultado   = numerador / denominador
		resultado  +=1
		resultado
	end

	def calcular_configuracion_enganche configuracion
		prc_enganche = configuracion.prc_enganche / 100
		prc_enganche
	end

	def agregarAtributosConfiguracion articulo, configuracion
		json                       = articulo.to_json
		parsed_json                = ActiveSupport::JSON.decode json
		parsed_json[:precio]       = articulo.precio * calcular_configuracion_precio(configuracion)
		parsed_json[:prc_enganche] = calcular_configuracion_enganche( configuracion )
		parsed_json[:enganche]     = parsed_json[:prc_enganche] * parsed_json[:precio]
		parsed_json
	end
end
