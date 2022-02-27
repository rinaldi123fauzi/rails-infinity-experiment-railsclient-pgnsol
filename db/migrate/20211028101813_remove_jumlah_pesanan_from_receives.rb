class RemoveJumlahPesananFromReceives < ActiveRecord::Migration[5.2]
  def change
    remove_column :receives, :jumlah_pesanan, :integer
  end
end
