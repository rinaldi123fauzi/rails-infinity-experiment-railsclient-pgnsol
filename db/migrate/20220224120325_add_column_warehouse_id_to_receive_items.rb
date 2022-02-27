class AddColumnWarehouseIdToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :receive_items, :warehouse, foreign_key: true
  end
end
