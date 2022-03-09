require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/player.rb'
require_relative './lib/game.rb'


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
    session[:attacked] = false
    redirect "/battleground"
  end
  
  get '/battleground' do
    @player1_name = $player1.name
    @player2_name = $player2.name
    @player2_hp = $player2.hit_points
    
    @attacked = session[:attacked]
    erb(:battleground)
  end
  
  post '/attack' do
    session[:attacked] = true
    @player1 = $player1
    @player2 = $player2
    @game = Game.new
    @game.attack(@player2)
    redirect "/battleground"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end