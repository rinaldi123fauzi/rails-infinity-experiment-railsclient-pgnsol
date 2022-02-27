class AddNamaInputerToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :nama_inputer, :string
  end
end
