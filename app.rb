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
  @user = User.new({:name => params[:fullname],:user_name => params[:username],:email => params[:emailadd],:password => params[:pass]})
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