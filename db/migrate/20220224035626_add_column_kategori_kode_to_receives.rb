class AddColumnKategoriKodeToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :kategori_kode, :string
  end
end
