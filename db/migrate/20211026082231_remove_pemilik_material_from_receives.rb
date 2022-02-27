class RemovePemilikMaterialFromReceives < ActiveRecord::Migration[5.2]
  def change
    remove_column :receives, :pemilik_material, :string
  end
end
