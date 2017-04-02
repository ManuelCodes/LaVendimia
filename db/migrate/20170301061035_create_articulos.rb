class CreateArticulos < ActiveRecord::Migration[5.0]
  def change
    create_table :articulos do |t|
      t.string :descripcion, limit: 100
      t.string :modelo, limit: 50
      t.decimal :precio, precision: 10, scale: 2
      t.boolean :existencia

      t.timestamps
    end
  end
end
