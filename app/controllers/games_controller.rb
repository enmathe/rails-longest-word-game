require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
    @stringletters = @letters.join
  end

  def score
    @word = params[:name].upcase
    @stringletters = params[:token]

    @response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
    @json = JSON.parse(@response.read)
  end
end
