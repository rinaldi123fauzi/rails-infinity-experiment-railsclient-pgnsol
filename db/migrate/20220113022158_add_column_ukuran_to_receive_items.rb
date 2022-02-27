class AddColumnUkuranToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :ukuran, :string
  end
end
