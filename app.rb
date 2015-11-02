require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user.rb'


helpers do
  
  def render(*args)
    if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
      return haml "_#{args.first[:partial]}".to_sym, :layout => false
    else
      super
    end
  
  end
end


get '/' do
	erb :home
end

get '/signup' do
	erb :signup
end


post '/signup' do
  @name = params[:name]
  @user_name = params[:user_name]
  @email = params[:email]
  @password = params[:password]
  @user = User.new({:name => @name,:user_name => @user_name,:email => @email,:password => @password})
  if @user.save
    'done'
    #redirect '/thankyou'
  else
    #flash[:notice] = "Error in signup"
    redirect '/signup'
  end
end

get '/thankyou'do
  erb :thankyou
end