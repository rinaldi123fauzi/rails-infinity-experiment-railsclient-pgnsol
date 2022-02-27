class AddTotalHargaPenerimaanToReceive < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :total_harga_penerimaan, :string
  end
end
