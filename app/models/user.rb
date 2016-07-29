require 'bcrypt'

class User

  # attr_reader :password
  attr_accessor :confirm_password

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  # property :confirm_password, String
  property :password_digest, String, length: 60

  validates_confirmation_of :password_digest, confirm: :confirm_password

  def password=(password)
    # @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
