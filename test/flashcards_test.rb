gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/guess.rb'
require './lib/round.rb'

class FlashcardsTest < Minitest::Test

  def test_cards_have_questions_and_answers
    card = Card.new("question", "answer")
    assert_equal card.question, "question"
    assert_equal card.answer, "answer"
  end

  def test_cards_have_different_questions_and_answers
    card = Card.new("different question", "different answer")
    assert_equal card.question, "different question"
    assert_equal card.answer, "different answer"
  end

  def test_guess_can_take_two_arguments
    guess = Guess.new("user response", "card")
    assert_equal guess.response, "user response"
    assert_equal guess.card, "card"
  end

  def test_guess_can_take_other_response
    guess = Guess.new("different user response", "card")
    assert_equal guess.response, "different user response"
  end

  def test_guess_can_take_card_objectcard
    card = Card.new("question", "answer")
    guess = Guess.new("user response", card)
    assert_equal guess.card, card
  end

  def test_guess_has_correct_method
    card = Card.new("question", "answer")
    guess = Guess.new("answer", card)
    assert_equal guess.correct?, true
  end

  def test_guess_has_working_feedback_method
    card = Card.new("question", "answer")
    guess = Guess.new("answer", card)
    assert_equal guess.feedback, "Correct!"
  end

  def test_deck_can_take_an_array_argument
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal deck.cards, [card_1, card_2, card_3]
  end

  def test_deck_does_count_work
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal deck.count, 3
  end

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

  def test_convert_file_to_deck
    
  end

end
