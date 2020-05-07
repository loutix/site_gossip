class User < ApplicationRecord
	belongs_to :city
	
	has_secure_password


	validates :password, presence: true, length: { minimum: 6 }
	


end
