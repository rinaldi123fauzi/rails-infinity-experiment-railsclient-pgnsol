class AddColumnLainToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :lain, :string
  end
end
