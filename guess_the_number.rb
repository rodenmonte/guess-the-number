require 'sinatra'
require 'sinatra/reloader'

number = rand(100) + 1
get '/' do
  guess = params['guess']
  message = check_guess(guess, number)
  erb :index, :locals => { :number => number, :message => message}
end

def check_guess(guess, number)
  if guess == "" || guess == nil
    message = "Guess the magic number!"
  elsif guess.to_i > number
    if guess.to_i - 5 <= number
      message = "Too high, try again. You are very close."
    else
      message = "Too high, try again."
    end
  elsif guess.to_i < number
    if guess.to_i + 5 >= number
      message = "Too low, try again. You are very close."
    else
      message = "Too low, try again."
    end
  else
    message = "You're right! The secret number is #{number}"
  end
end
