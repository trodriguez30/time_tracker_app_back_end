class User < ApplicationRecord
    has_many :projects

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    has_secure_password
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
end
