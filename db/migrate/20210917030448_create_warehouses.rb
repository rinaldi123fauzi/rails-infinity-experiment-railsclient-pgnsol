class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :nama_gudang
      t.text :alamat_gudang

      t.timestamps
    end
  end
end
