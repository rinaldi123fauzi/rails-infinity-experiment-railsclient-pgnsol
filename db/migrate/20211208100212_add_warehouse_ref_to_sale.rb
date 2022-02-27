class AddWarehouseRefToSale < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :warehouse, foreign_key: true
  end
end
