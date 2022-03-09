require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/battleground' do
    p params
    @player1 = params[:player1]
    @player2 = params[:player2]
    erb(:battleground)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end