class AddDivisionRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :division, foreign_key: true
  end
end
