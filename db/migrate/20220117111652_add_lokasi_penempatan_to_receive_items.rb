class AddLokasiPenempatanToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :lokasi_penempatan, :string
  end
end
