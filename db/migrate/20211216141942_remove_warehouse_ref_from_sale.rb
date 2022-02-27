class RemoveWarehouseRefFromSale < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sales, :warehouse, foreign_key: true
  end
end
