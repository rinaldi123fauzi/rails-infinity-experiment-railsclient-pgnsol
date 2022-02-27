class AddNamaProgramToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :nama_program, :string
  end
end
