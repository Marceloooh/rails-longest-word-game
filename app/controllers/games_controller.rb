class GamesController < ApplicationController
  def new
    # new game
    @letters = []

    10.times do
      @letters << ('a'..'z').to_a.sample
    end
  end

  def score
    @result = params[:long_word]
    @letters = params[:letters]
    @same = params[:long_word].sort == params[:letters].split.sort
    @real = verification?(:long_word)
  end

  private

  def verification?(real_word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{real_word}")
    json = JSON.parse(response.read)
    json['found']
  end
end

# puts "#{params[:letters]}"
