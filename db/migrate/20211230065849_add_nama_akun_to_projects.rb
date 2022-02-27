class AddNamaAkunToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :nama_akun, :string
  end
end
