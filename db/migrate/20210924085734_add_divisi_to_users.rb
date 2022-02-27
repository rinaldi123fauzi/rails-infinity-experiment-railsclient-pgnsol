class AddDivisiToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :divisi, :string
  end
end
