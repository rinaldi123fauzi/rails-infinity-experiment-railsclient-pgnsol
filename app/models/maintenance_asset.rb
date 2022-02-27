class MaintenanceAsset < ApplicationRecord
  belongs_to :status
  belongs_to :user
end
