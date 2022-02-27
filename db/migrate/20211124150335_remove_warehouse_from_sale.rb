class RemoveWarehouseFromSale < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sales, :warehouse, index: true, foreign_key: true
  end
end
