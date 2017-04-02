class ChangeBooleanToIntegerInArticulos < ActiveRecord::Migration[5.0]
  def up
    change_column :articulos, :existencia, :integer
  end

  def down
    change_column :articulos, :existencia, :boolean
  end
end
