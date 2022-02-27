class AddColumnKategoriToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :statuses, :kategori, :string
  end
end
