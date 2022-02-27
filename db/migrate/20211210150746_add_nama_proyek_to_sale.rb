class AddNamaProyekToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :nama_proyek, :string
  end
end
