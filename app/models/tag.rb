# require 'data_mapper'
# require 'dm-postgres-adapter'
# require_relative 'DB_setup'

class Tag
  include DataMapper::Resource

  property :id,   Serial
  property :name,  String

  has n, :links, :through => Resource

end
#
# db_setup
