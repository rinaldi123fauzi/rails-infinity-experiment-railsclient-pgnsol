class AddNamaProyekToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :nama_proyek, :string
  end
end
