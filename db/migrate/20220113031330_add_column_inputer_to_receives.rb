class AddColumnInputerToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :inputer, :string
  end
end
