class RemoveNamaProyekFromSaleItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_items, :nama_proyek, :string
  end
end
