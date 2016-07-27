require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'DB_setup'

class Link
  include DataMapper::Resource

  property :id,     Serial
  property :url,    String
  property :title,  String

end

db_setup
