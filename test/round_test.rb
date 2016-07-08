gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/guess.rb'
require './lib/round.rb'

class FlashcardsTest < Minitest::Test

  def test_round_can_take_deck_argument
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal round.deck, deck
  end

  def test_round_can_catch_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal round.guesses, []
  end

  def test_round_can_access_first_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal round.current_card, card_1
  end

  def test_round_can_record_guess

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    guess = Guess.new("Juneau", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess(guess)
    assert_equal guess, round.guesses[0]
  end

  def test_round_guesses_counts
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    guess = Guess.new("Juneau", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess(guess)
    assert_equal round.guesses.count, 1
  end

  def test_round_evaluates_correctness
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    guess_1 = Guess.new("Juneau", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess(guess_1)
    assert_equal round.guesses.first.feedback, "Correct!"
  end

  def test_number_correct_counts_number_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    guess_1 = Guess.new("Juneau", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess(guess_1)
    assert_equal round.number_correct, 1
  end

  def test_number_correct_counts_number_correct_over_one
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    guess_1 = Guess.new("Juneau", card_1)
    guess_2 = Guess.new("2", card_2)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess(guess_1)
    round.record_guess(guess_2)
    assert_equal round.number_correct, 1
  end
end
