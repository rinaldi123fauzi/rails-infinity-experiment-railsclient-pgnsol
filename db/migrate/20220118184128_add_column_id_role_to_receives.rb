class AddColumnIdRoleToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :id_role, :integer
  end
end
