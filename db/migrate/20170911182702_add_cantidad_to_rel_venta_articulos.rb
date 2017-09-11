class AddCantidadToRelVentaArticulos < ActiveRecord::Migration[5.0]
  def change
    add_column :rel_venta_articulos, :cantidad, :integer
  end
end
