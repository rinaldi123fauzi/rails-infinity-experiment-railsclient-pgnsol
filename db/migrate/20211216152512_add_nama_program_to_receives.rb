class AddNamaProgramToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :nama_program, :string
  end
end
