class User < ApplicationRecord
  #takes care of encrypting the password 
  #provides the authenticate method to authenticare with that password
  has_secure_password
  
  #validation
  validates :email, presence: true, uniqueness: true
end
