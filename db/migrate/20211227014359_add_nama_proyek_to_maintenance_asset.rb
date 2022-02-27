class AddNamaProyekToMaintenanceAsset < ActiveRecord::Migration[5.2]
  def change
    add_column :maintenance_assets, :nama_proyek, :string
  end
end
