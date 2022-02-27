class AddJumlahPermintaanToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :jumlah_permintaan, :integer
  end
end
