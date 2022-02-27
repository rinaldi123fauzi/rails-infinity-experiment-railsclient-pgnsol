class CreateItemGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :item_groups do |t|
      t.string :kelompok_barang

      t.timestamps
    end
  end
end
