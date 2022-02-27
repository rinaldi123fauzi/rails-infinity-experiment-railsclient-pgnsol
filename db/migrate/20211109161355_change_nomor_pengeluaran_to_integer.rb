class ChangeNomorPengeluaranToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :expenditures, :nomor_pengeluaran, :string
  end
end
