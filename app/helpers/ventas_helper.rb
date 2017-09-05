module VentasHelper
	def show_articulo 
		@articulo = Articulo.find( params[:id_articulo] );
	end
end
