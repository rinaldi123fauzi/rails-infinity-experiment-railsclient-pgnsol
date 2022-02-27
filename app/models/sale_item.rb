class SaleItem < ApplicationRecord
  belongs_to  :sale
  belongs_to  :measurement
  belongs_to :warehouse
  belongs_to  :receive_item

  # has_many  :receive_items, through: :receive
end
