class SaleHistory < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :sale
  belongs_to :role, optional: true
end
