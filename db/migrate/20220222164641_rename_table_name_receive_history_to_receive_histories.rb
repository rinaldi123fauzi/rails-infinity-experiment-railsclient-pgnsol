class RenameTableNameReceiveHistoryToReceiveHistories < ActiveRecord::Migration[5.2]
  def change
    rename_table :receive_history, :receive_histories
  end
end
