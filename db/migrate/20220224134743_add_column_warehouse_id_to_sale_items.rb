class AddColumnWarehouseIdToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :sale_items, :warehouse, foreign_key: true
  end
end
