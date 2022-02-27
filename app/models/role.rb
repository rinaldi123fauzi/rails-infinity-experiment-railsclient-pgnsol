# frozen_string_literal: true

class Role < RoleCore::Role
  has_many :role_assignments, dependent: :destroy
  has_many :users, through: :role_assignments
  has_many :receive_history
end
