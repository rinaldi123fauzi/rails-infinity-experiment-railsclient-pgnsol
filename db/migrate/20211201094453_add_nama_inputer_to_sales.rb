class AddNamaInputerToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :nama_inputer, :string
  end
end
