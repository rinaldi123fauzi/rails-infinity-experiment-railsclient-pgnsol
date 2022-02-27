class AddNamaAkunToMaintenanceAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :maintenance_assets, :nama_akun, :string
  end
end
