class AddHargaSatuanToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :harga_satuan, :string
  end
end
