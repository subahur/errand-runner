require 'sinatra'

get '/' do
	erb :index
end

get '/about' do
	erb :about
end

get '/blog' do
	erb :blog
end
