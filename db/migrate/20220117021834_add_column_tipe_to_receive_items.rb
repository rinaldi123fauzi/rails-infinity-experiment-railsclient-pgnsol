class AddColumnTipeToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :tipe, :string
  end
end
