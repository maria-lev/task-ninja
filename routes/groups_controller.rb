require 'sinatra/base'
require 'json'
require_relative '../models/group'
require_relative '../models/task'

class GroupsController < Sinatra::Base
  get '/groups' do
    groups = Group.all
    groups.to_json(include: :tasks)
  end

  post '/groups' do
    request.body.rewind
    group = JSON.parse(request.body.read)
    new_group = Group.create(name: group['name'])
    new_group.to_json
  end

  put '/groups/:id' do
    request.body.rewind
    group = JSON.parse(request.body.read)
    updated_group = Group.update(params[:id], name: group['name'])
    updated_group.to_json
  end

  delete '/groups/:id' do
    Group.destroy(params[:id])
    status 204
  end

  get '/groups/:id/tasks' do
    tasks = Task.where(group_id: params[:id])
    tasks.to_json
  end

  post '/groups/:id/tasks' do
    request.body.rewind
    tasks = JSON.parse(request.body.read)
    new_tasks = Task.create(title: tasks['title'], completed: tasks['completed'], group_id: params[:id])
    new_tasks.to_json
  end
end