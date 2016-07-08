require './lib/card.rb'
require './lib/deck.rb'
require './lib/guess.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require "pry"


filename = "cards.txt"
cards = CardGenerator.new(filename).cards


deck = Deck.new(cards)
round = Round.new(deck)

round.start
