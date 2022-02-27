class AddReceiveRefToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :sale_items, :receive, foreign_key: true
  end
end
