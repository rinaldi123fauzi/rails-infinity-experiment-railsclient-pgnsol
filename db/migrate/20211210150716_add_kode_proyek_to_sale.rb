class AddKodeProyekToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :kode_proyek, :string
  end
end
