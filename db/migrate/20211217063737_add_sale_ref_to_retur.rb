class AddSaleRefToRetur < ActiveRecord::Migration[5.2]
  def change
    add_reference :returs, :sale, foreign_key: true
  end
end
