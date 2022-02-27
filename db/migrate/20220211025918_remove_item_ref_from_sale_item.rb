class RemoveItemRefFromSaleItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sale_items, :item, foreign_key: true
  end
end
