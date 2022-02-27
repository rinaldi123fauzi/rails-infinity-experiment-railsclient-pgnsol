class ChangeDataTypeNomorPengeluaranFromProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :nomor_pengeluaran, :string
  end
end
