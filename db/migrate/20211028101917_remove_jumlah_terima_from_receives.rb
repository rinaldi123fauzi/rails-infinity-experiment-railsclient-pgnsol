class RemoveJumlahTerimaFromReceives < ActiveRecord::Migration[5.2]
  def change
    remove_column :receives, :jumlah_terima, :integer
  end
end
