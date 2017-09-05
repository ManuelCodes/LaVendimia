class RelVentaArticulo < ApplicationRecord
	belongs_to :venta
	belongs_to :articulos
end
