class AddLokasiPenempatanToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :lokasi_penempatan, :string, null: true
  end
end
