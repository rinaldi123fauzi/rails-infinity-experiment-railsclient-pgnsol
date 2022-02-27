class AddReceiveRefToRetur < ActiveRecord::Migration[5.2]
  def change
    add_reference :returs, :receive, foreign_key: true
  end
end
