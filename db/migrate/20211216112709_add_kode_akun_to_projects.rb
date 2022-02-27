class AddKodeAkunToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :kode_akun, :string
  end
end
