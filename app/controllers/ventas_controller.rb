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

	# get 
	def preventa
		@articulo = Articulo.find( params[:id_articulo] );
		render :layout => false
		#redirect_to :controller => 'articulos', :action => 'show', :id => 1
	end

end
