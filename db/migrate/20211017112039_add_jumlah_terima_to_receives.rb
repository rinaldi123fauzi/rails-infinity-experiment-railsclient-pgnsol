class AddJumlahTerimaToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :jumlah_terima, :integer, null: true
  end
end
