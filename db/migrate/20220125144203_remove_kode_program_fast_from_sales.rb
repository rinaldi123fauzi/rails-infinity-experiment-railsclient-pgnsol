class RemoveKodeProgramFastFromSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :kode_program_fast, :string
  end
end
