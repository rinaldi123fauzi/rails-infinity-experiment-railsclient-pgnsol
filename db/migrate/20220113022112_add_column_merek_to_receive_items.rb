class AddColumnMerekToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :merek, :string
  end
end
