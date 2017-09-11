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
		#todo here
		var = params[:articulosAVender]
		puts "#{var[0][:id]}"
		venta = Venta.new
		venta_id = clave_format(Venta.maximum(:id).to_i.next);
		ActiveRecord::Base.transaction do
			venta.cliente_id   = params[:cliente_id]
			venta.enganche     = params[:enganche]
			venta.total        = params[:total]
			venta.bonificacion = params[:bonificacion]
			venta.plazo_meses  = params[:plazo_meses]
			venta.id           = venta_id;
			venta.save!
			params[:articulosAVender].each do |articulo|
				rva             = RelVentaArticulo.new
				rva.venta_id    = venta_id;
				
				rva.articulo_id = articulo[:id]
				
				rva.cantidad    = articulo[:cantidad]
				puts "666666666666666666666666666666666666666#{venta_id}"
				rva.save!
				a = Articulo.find(articulo[:id])
				a.existencia = a.existencia.to_i - articulo[:cantidad].to_i;
				a.save!
			end
		end
	end
	# PATCH/PUT /ventas/1
	def update
	end

	def articulo_precio_calculado
		articulo      = Articulo.find( params[:id_articulo] )
		configuracion = Configuracion.find(1)
		articulo      = agregarAtributosConfiguracion articulo, configuracion
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
