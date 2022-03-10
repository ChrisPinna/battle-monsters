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

  post '/player1turn' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)
    session[:attacked] = false
    redirect "/player1turn"
  end
  
  get '/player1turn' do
    @player1_name = $game.player1.name
    @player2_name = $game.player2.name
    @player2_hp = $game.player2.hit_points
    @player1_hp = $game.player1.hit_points
    
    @attacked = session[:attacked]
    erb(:player1turn)
  end

  post '/player2turn' do
    session[:attacked] = false
    redirect "/player2turn"
  end

  get '/player2turn' do
    @player1_name = $game.player1.name
    @player2_name = $game.player2.name
    @player2_hp = $game.player2.hit_points
    @player1_hp = $game.player1.hit_points
    erb(:player2turn)
  end
  
  post '/attack' do
    session[:attacked] = true
    @player1 = $game.player1
    @player2 = $game.player2
    $game.attack(@player2)
    redirect "/player1turn"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end