require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/hogwarts_students')
require('pry-byebug')

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  erb(:new)
end

post '/students' do
  @student = Student.new( params )
  @student.save()
  erb( :create )
end

get '/students/:id' do
  @student = Student.find_by_id(params[:id].to_i)
  erb(:show)
end

post '/students/:id/delete' do
  student = Student.find_by_id(params[:id].to_i)
  student.delete
  redirect to '/students'
end
