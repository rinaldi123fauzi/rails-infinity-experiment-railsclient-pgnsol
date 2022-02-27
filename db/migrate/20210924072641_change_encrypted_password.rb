class ChangeEncryptedPassword < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :encrypted_password, null: true
  end
end
