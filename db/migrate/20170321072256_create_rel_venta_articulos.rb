class CreateRelVentaArticulos < ActiveRecord::Migration[5.0]
  def change
    create_table :rel_venta_articulos do |t|
      t.integer :venta_id
      t.integer :articulo_id

      t.timestamps
    end
  end
end
