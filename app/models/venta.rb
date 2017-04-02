class Venta < ApplicationRecord
	belongs_to :cliente
	has_many :RelVentaArticulo
	self.table_name = "ventas"
end
