class AddKodeAkunToMaintenanceAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :maintenance_assets, :kode_akun, :string
  end
end
