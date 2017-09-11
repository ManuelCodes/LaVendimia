class AddPlazoMesesToVentas < ActiveRecord::Migration[5.0]
  def change
    add_column :ventas, :plazo_meses, :integer
  end
end
