class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true

  class << self
    def from_omniauth(response)
      User.find_or_create_by(uid: response[:uid]) do |user|
        user.username = response[:info][:name]
        user.email = response[:info][:email]
      end
    end
  end
end
