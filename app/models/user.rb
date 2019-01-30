class User < ApplicationRecord
    has_secure_password

	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :username, presence: true, uniqueness: true
end
