require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/player.rb'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/battleground' do
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    session[:player2_HP] = 10
    session[:attacked] = false
    # session[:message] = "We gotcha #{@player1} & #{@player2}."
    redirect "/battleground"
  end
  
  get '/battleground' do
    # @message = session[:message]
    @player1_name = $player1.name
    @player2_name = $player2.name
    @player2_HP = session[:player2_HP]
    @attacked = session[:attacked]
    erb(:battleground)
  end
  
  post '/attack' do
    session[:attacked] = true
    session[:player2_HP] -= 1
    redirect "/battleground"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end