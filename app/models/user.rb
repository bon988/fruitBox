class User < ApplicationRecord
  #takes care of encrypting the password 
  #provides the authenticate method to authenticare with that password
  has_secure_password
  
  #validation - to make sure we have an email address and it is unique
  validates :email, presence: true, uniqueness: true
end
