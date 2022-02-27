class AddStatusItemToReceiveItem < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :status_item, :string
  end
end
