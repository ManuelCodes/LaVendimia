class VentasController < ApplicationController
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

end
