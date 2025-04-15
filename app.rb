require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:rules)
end

# Rock route
get("/rock") do
  @player_move = "rock"
  choices = ["rock", "paper", "scissors"]
  @computer_move = choices.sample

  if @player_move == @computer_move
    @outcome = "We tied!"
  elsif @computer_move == "scissors"
    @outcome = "We won!"
  else
    @outcome = "We lost!"
  end

  erb(:result)
end

# Paper route
get("/paper") do
  @player_move = "paper"
  choices = ["rock", "paper", "scissors"]
  @computer_move = choices.sample

  if @player_move == @computer_move
    @outcome = "We tied!"
  elsif @computer_move == "rock"
    @outcome = "We won!"
  else
    @outcome = "We lost!"
  end

  erb(:result)
end

# Scissors route
get("/scissors") do
  @player_move = "scissors"
  choices = ["rock", "paper", "scissors"]
  @computer_move = choices.sample

  if @player_move == @computer_move
    @outcome = "We tied!"
  elsif @computer_move == "paper"
    @outcome = "We won!"
  else
    @outcome = "We lost!"
  end

  erb(:result)
end
