class AddColumnSerialToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :serial, :string
  end
end
