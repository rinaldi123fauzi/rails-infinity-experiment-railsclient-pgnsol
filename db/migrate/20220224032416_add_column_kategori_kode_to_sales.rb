class AddColumnKategoriKodeToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :kategori_kode, :string
  end
end
