class AddColumnInisialToWarehouses < ActiveRecord::Migration[5.2]
  def change
    add_column :warehouses, :inisial, :string
  end
end
