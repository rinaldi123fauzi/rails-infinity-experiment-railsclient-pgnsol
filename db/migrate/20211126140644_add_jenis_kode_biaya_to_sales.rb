class AddJenisKodeBiayaToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :jenis_kode_biaya, :string
  end
end
