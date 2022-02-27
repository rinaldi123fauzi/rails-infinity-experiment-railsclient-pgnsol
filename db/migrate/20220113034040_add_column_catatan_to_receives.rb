class AddColumnCatatanToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :catatan, :string
  end
end
