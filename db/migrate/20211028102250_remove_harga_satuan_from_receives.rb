class RemoveHargaSatuanFromReceives < ActiveRecord::Migration[5.2]
  def change
    remove_column :receives, :harga_satuan, :string
  end
end
