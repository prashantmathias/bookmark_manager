require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String, length: 40

  password = BCrypt::Password.create(password)


end
