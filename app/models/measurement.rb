class Measurement < ApplicationRecord
  has_many :receive_item
  has_many :sale_item
end
