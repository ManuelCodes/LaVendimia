class VentasController < ApplicationController
	require 'date'
	include VentasHelper
	helper_method :clave_format
	# GET /ventas
	def index
		sql =
		"
			SELECT
				v.id as folio_venta, c.id as clave_cliente, c.nom_cliente, c.ap_paterno, c.ap_materno, v.total, v.created_at
			FROM ventas v
			INNER JOIN clientes c ON
				v.cliente_id = c.id
		"
		@ventas = ActiveRecord::Base.connection.execute(sql);
		#@ventas = Articulo.paginate(:page => params[:page])
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
				rva.save!
				a = Articulo.find(articulo[:id])
				a.existencia = a.existencia.to_i - articulo[:cantidad].to_i;
				a.save!
			end
		end
		flash[:notice] = 'Bien hecho! Tu venta ha sido registrada correctamente'
		redirect_to ventas_path
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
		#le damos formato a los deciamales
		#@articulo.precio       = "%.2f" % @articulo.precio.to_d
		#@articulo.prc_enganche = "%.2f" % @articulo.prc_enganche.to_d
		#@articulo.enganche     = "%.2f" % @articulo.enganche.to_d
		render :layout => false
		#respond_to do |format|
		#	puts "#{format}"
		#	format.html { render :layout => false }
		#	format.json { render :json => @articulo }
	    #end
		#redirect_to :controller => 'articulos', :action => 'show', :id => 1
	end
end
