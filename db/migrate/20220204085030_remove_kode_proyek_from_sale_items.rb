class RemoveKodeProyekFromSaleItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_items, :kode_proyek, type: :string
  end
end
