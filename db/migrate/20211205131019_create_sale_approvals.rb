class CreateSaleApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_histories do |t|
      t.string :catatan_penjualan
      t.references :user, foreign_key: true
      t.references :status, foreign_key: true
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
