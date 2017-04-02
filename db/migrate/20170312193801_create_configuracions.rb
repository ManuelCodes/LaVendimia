class CreateConfiguracions < ActiveRecord::Migration[5.0]
  def change
    create_table :configuracions do |t|
      t.decimal :tasa, precision: 10, scale: 2
      t.decimal :prc_enganche, precision: 10, scale: 2
      t.integer :plazo_maximo

      t.timestamps
    end
  end
end
