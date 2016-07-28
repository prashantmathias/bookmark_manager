require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, String, length: 70

  #attr_reader :password
  attr_accessor :confirm_password

  validates_confirmation_of :password_digest, :confirm => :confirm_password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
