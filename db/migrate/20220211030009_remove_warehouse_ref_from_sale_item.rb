class RemoveWarehouseRefFromSaleItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sale_items, :warehouse, foreign_key: true
  end
end
