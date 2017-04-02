class CreateVenta < ActiveRecord::Migration[5.0]
  def change
    create_table :ventas do |t|
      t.integer :cliente_id
      t.decimal :enganche, precision: 10, scale: 2
      t.decimal :importe, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.decimal :bonificacion, precision: 10, scale: 2

      t.timestamps
    end
  end
end
