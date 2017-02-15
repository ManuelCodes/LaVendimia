class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nom_cliente, limit: 50
      t.string :ap_paterno, limit: 50
      t.string :ap_materno, limit: 50
      t.string :rfc, limit: 13

      t.timestamps
    end
  end
end
