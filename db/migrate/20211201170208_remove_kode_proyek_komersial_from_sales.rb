class RemoveKodeProyekKomersialFromSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :kode_proyek_komersial, :string
  end
end
