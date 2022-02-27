class AddKodeProgramToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :kode_program, :string
  end
end
