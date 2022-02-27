class AddJumlahKeluarToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :jumlah_keluar, :integer
  end
end
