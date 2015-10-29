require 'sinatra'


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

get '/about' do
	erb :about
end

get '/blog' do
	erb :blog
end
