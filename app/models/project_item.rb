class ProjectItem < ApplicationRecord
  belongs_to :item
  belongs_to :measurement
  belongs_to :project, dependent: :destroy
end
