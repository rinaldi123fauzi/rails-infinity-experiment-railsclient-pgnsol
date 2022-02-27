class AddColumnLainToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :lain, :string
  end
end
