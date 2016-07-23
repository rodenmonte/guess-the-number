require 'sinatra'
require 'sinatra/reloader'

the_number = rand(100) + 1
get '/' do
  erb :index, :locals => { :number => the_number}
end
