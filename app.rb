require "sinatra"
require "rubygems"
require "csv"
require_relative "hangman.rb"

enable :sessions

get '/' do
  session[:game]= Hangman.new
  erb :home, :locals => { game => session[:game] }
  # :layout => :home_layout
end

get '/player' do
  erb :player, :locals => { :game => session[:game], :player_name => session[:player_name] }
  # :layout => :home_layout
end

post '/player_name' do
  session[:player_name] = params[:player]
  erb :play_game, :locals => { :game => session[:game], :player_name => session[:player_name] }
  # :layout => :home_layout :locals => { :player_name => session[:player_name] }
end
