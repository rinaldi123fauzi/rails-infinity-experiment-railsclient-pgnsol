class AddDivisionToReceives < ActiveRecord::Migration[5.2]
  def change
    add_reference :receives, :division, foreign_key: true
  end
end
