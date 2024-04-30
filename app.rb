require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
  
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:rules, { :layout => :wrapper })
end

get("/rock") do
  @opp = ["rock", "paper", "scissors"].sample
  @you = "rock"
  if @opp == "rock"
    @result = "tied"
  elsif @opp == "paper"
    @result = "lost"
  elsif @opp == "scissors"
    @result = "won"
  end

  erb(:body, { :layout => :wrapper })
end

get("/paper") do
  @opp = ["rock", "paper", "scissors"].sample
  @you = "paper"
  if @opp == "rock"
    @result = "won"
  elsif @opp == "paper"
    @result = "tied"
  elsif @opp == "scissors"
    @result = "lost"
  end

  erb(:body, { :layout => :wrapper })
end

get("/scissors") do
  @opp = ["rock", "paper", "scissors"].sample
  @you = "scissors"
  if @opp == "rock"
    @result = "lost"
  elsif @opp == "paper"
    @result = "won"
  elsif @opp == "scissors"
    @result = "tied"
  end

  erb(:body, { :layout => :wrapper })
end
