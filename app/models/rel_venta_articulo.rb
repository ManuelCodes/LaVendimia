class RelVentaArticulo < ApplicationRecord
	belongs_to :venta
	has_many :articulos
end
