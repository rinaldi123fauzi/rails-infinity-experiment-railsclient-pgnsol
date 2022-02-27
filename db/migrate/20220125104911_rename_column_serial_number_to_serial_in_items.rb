class RenameColumnSerialNumberToSerialInItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :serial_number, :serial
  end
end
