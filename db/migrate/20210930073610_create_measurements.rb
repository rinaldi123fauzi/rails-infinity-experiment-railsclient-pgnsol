class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.string :nama_satuan

      t.timestamps
    end
  end
end
