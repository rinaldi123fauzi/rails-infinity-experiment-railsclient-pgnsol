class RemoveJenisKodeBiaya < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :jenis_kode_biaya, :string
  end
end
