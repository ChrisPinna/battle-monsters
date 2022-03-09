require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/battleground' do
    session[:player1] = params[:player1]
    session[:player2] = params[:player2]
    session[:player2_HP] = 10
    # session[:message] = "We gotcha #{@player1} & #{@player2}."
    redirect "/battleground"
  end
  
  get '/battleground' do
    # @message = session[:message]
    @player1 = session[:player1]
    @player2 = session[:player2]
    @player2_HP = session[:player2_HP]
    erb(:battleground)
  end
  
  post '/attack' do
    session[:player2_HP] -= 1
    redirect "/battleground"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end