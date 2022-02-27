class ReceiveHistory < ApplicationRecord
  # self.table_name = "receive_history"
  belongs_to :receive
  belongs_to :status
  belongs_to :user, optional: true
  belongs_to :role, optional: true
end
