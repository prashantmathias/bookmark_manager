require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non destructive upgrade" do
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts "Auto upgrade completed without data loss"
    end
  end
end
