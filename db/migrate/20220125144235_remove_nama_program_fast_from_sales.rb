class RemoveNamaProgramFastFromSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :nama_program_fast, :string
  end
end
