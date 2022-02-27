class AddJumlahHargaToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :jumlah_harga, :string
  end
end
