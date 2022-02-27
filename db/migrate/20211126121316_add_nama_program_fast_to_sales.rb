class AddNamaProgramFastToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :nama_program_fast, :string
  end
end
