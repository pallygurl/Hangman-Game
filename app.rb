require "sinatra"
require_relative "hangman.rb"

enable :sessions

get '/' do
  erb :home
end

get '/player_name' do
  erb :player_name
end

post '/player_name' do
  session[:player_name] = params[:player_name]
  erb :get_word
end

# get '/get_word' do
# end

# post '/get_word' do
#   # redirect '/play_game' do
# end       
