class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :nama_status

      t.timestamps
    end
  end
end
