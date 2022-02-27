class Receive < ApplicationRecord
  mount_uploaders :dokumen, ReceiveUploader
  belongs_to :warehouse
  belongs_to :status
  belongs_to :user
  belongs_to :division
  has_many :sale, dependent: :destroy
  has_many :receive_history, dependent: :destroy
  has_many :receive_items, dependent: :destroy
  has_many :items, through: :receive_items, dependent: :destroy
  # has_many :items, dependent: :destroy

  after_update :setReceiveHistory

  attr_accessor :role_id

  validates :tanggal_po, presence: true

  private
  def setReceiveHistory
    if self.status_id == 3
      #TODO buat benerin error saat approval
      ReceiveHistory.create!(
        receive_id: self.id,
        status_id: self.status_id,
        user_id: self.user_id,
        role_id: 3
      )
    end
  end
end
