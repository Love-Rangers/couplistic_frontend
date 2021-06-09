class User < ApplicationRecord
  validates :display_name, presence: true
  validates :email, presence: true

end
