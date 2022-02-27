class AddDokumenPengeluaranToExpenditures < ActiveRecord::Migration[5.2]
  def change
    add_column :expenditures, :dokumen_pengeluaran, :json
  end
end
