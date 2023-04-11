require 'sinatra/base'
require 'json'
require_relative '../models/task'

class TasksController < Sinatra::Base
  get '/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  post '/tasks' do
    request.body.rewind
    task = JSON.parse(request.body.read)
    new_task = Task.create(title: task['title'], completed: task['completed'])
    new_task.to_json
  end

  put '/tasks/:id' do
    request.body.rewind
    task = JSON.parse(request.body.read)
    updated_task = Task.update(params[:id], title: task['title'], completed: task['completed'])
    updated_task.to_json
  end

  delete '/tasks/:id' do
    Task.destroy(params[:id])
    status 204
  end
end