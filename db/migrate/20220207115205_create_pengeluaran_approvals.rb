class CreatePengeluaranApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :pengeluaran_approvals do |t|
      t.references :sale, foreign_key: true
      t.references :status, foreign_key: true
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
