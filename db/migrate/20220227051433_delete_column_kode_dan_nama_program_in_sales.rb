class DeleteColumnKodeDanNamaProgramInSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :kode_program, :string
    remove_column :sales, :nama_program, :string
  end
end
