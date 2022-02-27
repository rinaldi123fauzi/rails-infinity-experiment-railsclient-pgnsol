class DeleteTableReceiveLocations < ActiveRecord::Migration[5.2]
  def change
    drop_table :receive_locations
  end
end
