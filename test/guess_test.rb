gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess.rb'
require './lib/card.rb'


class FlashcardsTest < Minitest::Test

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
end
