class RemoveWarehouseRefFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :warehouse, index: true, foreign_key: true
  end
end
