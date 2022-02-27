class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :ldap_authenticatable,
         :recoverable, :validatable

  has_many :role_assignments, dependent: :destroy
  has_many :roles, through: :role_assignments
  belongs_to :division
  has_many :receive_history
  has_many :notifications, as: :recipient

  def computed_permissions
    roles.map(&:computed_permissions).reduce(RoleCore::ComputedPermissions.new, &:concat)
  end

  def active_for_authentication?
    super && state && confirm
  end

  def inactive_message
    state ? super : :user_not_active
    confirm ? super : :user_not_confirm
  end

  def ldap_before_save
    self.email = Devise::LDAP::Adapter.get_ldap_param(username, 'mail').first
    self.user_type = 'LDAP'
    self.state = true
    self.confirm = false
  end

end
