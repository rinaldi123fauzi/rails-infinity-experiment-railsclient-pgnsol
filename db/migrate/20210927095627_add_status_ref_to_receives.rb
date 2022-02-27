class AddStatusRefToReceives < ActiveRecord::Migration[5.2]
  def change
    add_reference :receives, :status, foreign_key: true
  end
end
