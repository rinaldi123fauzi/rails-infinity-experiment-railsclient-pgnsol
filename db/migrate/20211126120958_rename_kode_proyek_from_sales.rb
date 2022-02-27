class RenameKodeProyekFromSales < ActiveRecord::Migration[5.2]
  def change
    rename_column :sales, :kode_proyek, :kode_proyek_komersial
  end
end
