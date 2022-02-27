class StockOpname < ApplicationRecord
  belongs_to :item
  belongs_to :measurement
  belongs_to :warehouse
end
