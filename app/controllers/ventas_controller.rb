class VentasController < ApplicationController
	include VentasHelper
	# GET /ventas
	def index
	end
	# GET /ventas/1
	def show
		
	end
	# GET /ventas/new
	def new
		@venta = Venta.new
		@clave = clave_format(Venta.maximum(:id).to_i.next)
	end
	# GET /ventas/1/edit
	def edit
	end
	# POST /ventas
	def create
	end
	# PATCH/PUT /ventas/1
	def update
	end

	def articulo_precio_calculado
		articulo                  = Articulo.find( params[:id_articulo] )
		configuracion             = Configuracion.find(1)
		articulo = agregarAtributosConfiguracion articulo, configuracion
		respond_to do |format|
			format.json {render :json => articulo}
		end
	end

	# get 
	def preventa
		@articulo              = Articulo.find( params[:id_articulo] )
		configuracion          = Configuracion.find(1)
		@articulo.precio       = @articulo.precio * calcular_configuracion_precio(configuracion)
		@articulo.prc_enganche = calcular_configuracion_enganche( configuracion )
		@articulo.enganche     = @articulo.prc_enganche * @articulo.precio;
		render :layout => false
		#respond_to do |format|
		#	puts "#{format}"
		#	format.html { render :layout => false }
		#	format.json { render :json => @articulo }
	    #end
		#redirect_to :controller => 'articulos', :action => 'show', :id => 1
	end
end
