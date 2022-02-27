class AddKodeProgramFastToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :kode_program_fast, :string
  end
end
