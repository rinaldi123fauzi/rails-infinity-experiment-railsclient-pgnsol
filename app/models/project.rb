class Project < ApplicationRecord
  mount_uploaders :dokumen_pengeluaran, ProjectUploader
  belongs_to :status
  belongs_to :user
  # belongs_to :warehouse
end
