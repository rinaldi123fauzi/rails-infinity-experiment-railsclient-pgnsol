class RemoveJumlahHargaFromReceives < ActiveRecord::Migration[5.2]
  def change
    remove_column :receives, :jumlah_harga, :string
  end
end
