class AddNamaAkunToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :nama_akun, :string
  end
end
