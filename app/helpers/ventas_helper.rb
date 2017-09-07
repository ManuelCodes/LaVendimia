module VentasHelper
	def show_articulo 
		@articulo = Articulo.find( params[:id_articulo] );
	end

	def calcular_configuracion
		configuracion = Configuracion.find(1)
		numerador     = (1  + ( configuracion.tasa *  configuracion.plazo_maximo ) )
		denominador   = 100
		resultado     = numerador / denominador
		resultado
	end

end
