require 'sinatra/base'
require './lib/player'
require './lib/game'

class RPSApp < Sinatra::Base
	get '/' do
		erb :index
	end

	post '/play' do
		@@player1 = Player.new(params[:player1])
		@player_name = @@player1.name
		# @player2 = Player.new(params[:player2])
		# @playerno = params[:playerno]
		erb :play
	end
	get '/play' do 
		@player_name = @@player1.name
		erb :play
	end
	post '/choice' do
		play_game = Game.new(params[:choice])
		@result = play_game.result
		@player = params[:choice]
		@computer = play_game.computer_choice
		erb :game
	end
	# start the server if ruby file executed directly
	run! if app_file == $0
end