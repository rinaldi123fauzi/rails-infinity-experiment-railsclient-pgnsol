class AddJumlahHargaBastToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :jumlah_harga_bast, :string
  end
end
