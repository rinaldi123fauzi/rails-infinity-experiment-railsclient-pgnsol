class AddDokumenToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :dokumen, :json
  end
end
