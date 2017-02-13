class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password

  validates :email, uniqueness: true
  validates :name,
            :email,
            :password, presence: true
end
