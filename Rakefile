require 'sinatra/activerecord/rake'
require './app'

task :environment do
    ActiveRecord::Base.establish_connection(settings.database)
end

task :db => :environment do
    ActiveRecord::Base.connection.create_database(settings.database[:database])
end