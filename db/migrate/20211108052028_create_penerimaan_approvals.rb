class CreatePenerimaanApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :penerimaan_approvals do |t|
      t.references :receive, foreign_key: true
      t.references :status, foreign_key: true
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true
      t.string :catatan_penerimaan

      t.timestamps
    end
  end
end
