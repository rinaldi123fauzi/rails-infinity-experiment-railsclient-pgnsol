class AddNamaProyekKomersialToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :nama_proyek_komersial, :string
  end
end
