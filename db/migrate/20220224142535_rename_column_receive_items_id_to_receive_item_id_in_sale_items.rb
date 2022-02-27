class RenameColumnReceiveItemsIdToReceiveItemIdInSaleItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :sale_items, :receive_items_id, :receive_item_id
  end
end
