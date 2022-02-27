class AddKodeAkunToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :kode_akun, :string
  end
end
