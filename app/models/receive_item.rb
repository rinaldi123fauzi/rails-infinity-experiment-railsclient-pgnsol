class ReceiveItem < ApplicationRecord
  belongs_to :receive
  belongs_to :item
  belongs_to :warehouse
  belongs_to :measurement
  has_many :sale_item

  def kodeItem
    "#{self.item.kode_barang}" 
  end
end
