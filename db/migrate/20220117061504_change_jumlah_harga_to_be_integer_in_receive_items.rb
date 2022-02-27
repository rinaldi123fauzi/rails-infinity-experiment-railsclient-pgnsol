class ChangeJumlahHargaToBeIntegerInReceiveItems < ActiveRecord::Migration[5.2]
  def change
    change_column :receive_items, :jumlah_harga, 'integer USING CAST(jumlah_harga AS integer)'
  end
end
