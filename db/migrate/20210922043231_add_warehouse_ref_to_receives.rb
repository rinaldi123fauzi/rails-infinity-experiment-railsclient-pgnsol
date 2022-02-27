class AddWarehouseRefToReceives < ActiveRecord::Migration[5.2]
  def change
    add_reference :receives, :warehouse, foreign_key: true
  end
end
