class RemoveReceiveRefFromSaleItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_items, :receive_id, :string
  end
end
