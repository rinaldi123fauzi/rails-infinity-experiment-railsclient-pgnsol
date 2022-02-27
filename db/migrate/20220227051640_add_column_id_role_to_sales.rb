class AddColumnIdRoleToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :id_role, :integer
  end
end
