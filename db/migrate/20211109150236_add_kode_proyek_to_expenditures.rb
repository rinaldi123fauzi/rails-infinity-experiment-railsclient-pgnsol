class AddKodeProyekToExpenditures < ActiveRecord::Migration[5.2]
  def change
    add_column :expenditures, :kode_proyek, :string
  end
end
