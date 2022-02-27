class ChangeExpendituresToSales < ActiveRecord::Migration[5.2]
  def change
    rename_table :expenditures, :sales
  end
end
