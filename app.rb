require 'sinatra/base'
require 'sinatra/activerecord'

# set :database, { adapter: 'sqlite3', database: 'db/todos.sqlite3' }

# Require all files in the 'models' directory
Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }

# Require all files in the 'routes' directory
Dir[File.join(__dir__, 'routes', '*.rb')].each { |file| require file }

# Define the API endpoints
class TaskApp < Sinatra::Base
  use TasksController
  use GroupsController
end

TaskApp.run!
