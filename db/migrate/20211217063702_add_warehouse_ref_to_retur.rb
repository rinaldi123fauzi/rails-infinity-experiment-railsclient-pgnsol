class AddWarehouseRefToRetur < ActiveRecord::Migration[5.2]
  def change
    add_reference :returs, :warehouse, foreign_key: true
  end
end
