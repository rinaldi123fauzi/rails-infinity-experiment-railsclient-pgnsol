# frozen_string_literal: true
class ItemGroup < ApplicationRecord
  has_many :items, dependent: :destroy
end
