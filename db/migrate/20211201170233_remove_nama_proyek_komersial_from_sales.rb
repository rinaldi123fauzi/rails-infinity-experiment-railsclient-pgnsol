class RemoveNamaProyekKomersialFromSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :nama_proyek_komersial, :string
  end
end
