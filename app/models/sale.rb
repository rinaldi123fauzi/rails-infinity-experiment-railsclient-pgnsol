class Sale < ApplicationRecord
  belongs_to :status
  belongs_to :receive
  has_one :user
  has_many :sale_items, dependent: :destroy
  has_many :sale_history, dependent: :destroy
  # has_many :receive_items
  # belongs_to :receive
  mount_uploaders :dokumen_penjualan, SaleUploader
end
