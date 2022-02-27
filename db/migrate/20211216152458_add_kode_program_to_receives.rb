class AddKodeProgramToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :kode_program, :string
  end
end
