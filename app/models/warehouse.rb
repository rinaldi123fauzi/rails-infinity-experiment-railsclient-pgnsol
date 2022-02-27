class Warehouse < ApplicationRecord
  has_many :receive_item
  has_many :receive
  has_many :sale_item

  # after_commit :create_notifications, on: [:create]

  # def create_notifications
  #   Notification.create(
  #     notify_type: 'add new warehouse',
  #     actor: self.user_id,
  #     user: self.user_class,
  #     target: self
  #   )
  # end
end
