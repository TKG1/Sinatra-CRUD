require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'sinatra/activerecord' 
require './models/tasks.rb' 

#一覧表示
get '/tasks' do 
    @tasks = Task.all
    erb :'tasks/index'
end

#新規登録画面
get '/tasks/new' do 
    erb :'tasks/new'
end

#詳細表示
get '/tasks/:id' do 
    @task = Task.find(params[:id])
    erb :'tasks/show'
end

#登録
post '/tasks' do 
    @task = Task.create(name: params[:name],content: params[:content])
    @task.save
    redirect to('/tasks')
end

#編集画面
get '/tasks/:id/edit' do
    @task = Task.find(params[:id])
    erb :'tasks/edit'
end

#更新
patch '/tasks/:id' do 
    @task = Task.find(params[:id])
    @task.name = params[:name]
    @task.content = params[:content]
    @task.save
    redirect to("/tasks")
end

#削除
delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
    redirect to("/tasks")
end

#メソッド
def link_to(text,url)
    "<a href=#{url}>#{text}</a>"
end
