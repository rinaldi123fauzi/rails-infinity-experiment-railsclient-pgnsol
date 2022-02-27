require 'devise/strategies/database_authenticatable'

module Devise
  module Strategies
    class CustomDatabaseAuthenticatable < DatabaseAuthenticatable
      def valid?
        true
      end

      def authenticate!
        return fail(:invalid) unless valid_for_params_auth?

        username = params_auth_hash[:username]
        password = params_auth_hash[:password]
        user = User.find_by(username: username)
        if user&.valid_password?(password)
          success!(user)
        else
          fail(:not_found_in_database)
        end
      end
    end
  end
end

Warden::Strategies.add(:custom_database_authenticatable, Devise::Strategies::CustomDatabaseAuthenticatable)
