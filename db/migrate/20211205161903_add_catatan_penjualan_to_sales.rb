class AddCatatanPenjualanToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :catatan_penjualan, :string
  end
end
