class AddConfirmToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirm, :boolean, :default => false
  end
end
