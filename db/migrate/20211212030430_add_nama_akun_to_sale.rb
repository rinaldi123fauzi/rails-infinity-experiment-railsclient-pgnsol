class AddNamaAkunToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :nama_akun, :string
  end
end
