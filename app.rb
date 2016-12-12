require "sinatra"
require_relative "hangman.rb"

enable :sessions

get '/' do
  erb :home
end

# get '/player_name' do
#   erb :player_name
# end

# post '/player_name' do
#   session[:player_name] = params[:player]
#   erb :get_word
# end

get '/get_word' do
	erb :get_word
end

post '/word' do
  word = params[:word]
  session[:game] = Hangman.new(word)
  redirect '/guess'
end

get '/guess' do
  @word = session[:game].word
	@tries = session[:game].tries

  erb :make_a_guess, :locals => { :tries => session[:tries], :guessed_letters => session[:game].guessed_letters } 
end

post '/guess' do
  guess = params[:guess]
	session[:game].make_guess(guess)
	if session[:game].winner?
	  result = "You win! :)"
		erb :game_over, locals: {result: result}
	elsif session[:game].loser?
	  result = "You lose! :("
		erb :game_over, locals: {result: result}
	else
    redirect '/guess'
	end
end 
